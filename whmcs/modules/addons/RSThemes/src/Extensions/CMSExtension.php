<?php 
namespace RSThemes\Extensions
{
    class CMSExtension extends Extension
    {
        public static $addonVersion = '2.1.9';
        public static $phpVersion = '7.2';
        public static $iconCubeVersion = '10.4.5';
        public static $phpModules = [
            'gd', 
            'curl', 
            'mbstring', 
            'dom', 
            'zip'
        ];
        public $name = 'Website Builder';
        public $description = 'Easily create captivating website pages with our WHMCS addon, enhancing your creative capabilities for building stunning web pages.';
        public $version = '1.0.1';
        public $selected = false;
        public function handle(array $params = [])
        {
        }
        /**
         * Template paths for views
         */
        public function getTplPath()
        {
            $licenseInfo = $this->checkLicense();
            if(!$this->isActive()) 
            {
                $name = 'info';
            }
            else if( $licenseInfo != 'success' ) 
            {
                $name = 'info';
                if($licenseInfo == 'Extension license is required') 
                {
                    $this->removeConfig();
                }
            }
            else
            {
                $name = 'settings';
            }
            return 'extensions/cms/' . $name;
        }
        /**
         * Extension Activate
         */
        public function loadConfig()
        {
            $result = $this->checkLicense();
            if($result != 'success') 
            {
                \RSThemes\Controller\Admin\TemplateController::redirect((new \RSThemes\View\ViewHelper())->url('Template@extension', [
                    'templateName' => $this->template->getMainName(), 
                    'extension' => $this->getLinkName()
                ]));
            }
            $result = true;
            if(!file_exists(ROOTDIR . DS . \RSThemes\Helpers\CMSHelper::$defaultFilename . '.php') && !file_put_contents(ROOTDIR . DS . \RSThemes\Helpers\CMSHelper::$defaultFilename . '.php', file_get_contents(\RSThemes\Processors\PageProcessor::getPageTemplateFile()))) 
            {
                \RSThemes\Helpers\Flash::setFlashMessage('danger', 'Page file cannot be created!');
                $result = false;
            }
            if($result) 
            {
                if(!\RSThemes\Models\Display::where('name', 'CMS')->first()) 
                {
                    $cmsRule = \RSThemes\Models\Display::create([
                        'name' => 'CMS', 
                        'active' => false
                    ]);
                    \RSThemes\Models\DisplayRule::create([
                        'display_id' => $cmsRule->id, 
                        'name' => 'Website', 
                        'slug' => 'website', 
                        'icon' => 'user', 
                        'navigation_layout' => 'default', 
                        'footer_layout' => 'default'
                    ]);
                    \RSThemes\Models\DisplayRule::create([
                        'display_id' => $cmsRule->id, 
                        'name' => 'Client Portal', 
                        'slug' => 'client-portal', 
                        'icon' => 'padlock', 
                        'navigation_layout' => 'default', 
                        'footer_layout' => 'default'
                    ]);
                    \RSThemes\Models\DisplayRule::create([
                        'display_id' => $cmsRule->id, 
                        'name' => 'Order Process', 
                        'slug' => 'order-process', 
                        'icon' => 'basket', 
                        'navigation_layout' => 'default', 
                        'footer_layout' => 'default'
                    ]);
                }
                (new \RSThemes\Migrations\Version_2_0\SectionMigrator())->up();
                if(!\WHMCS\Database\Capsule::schema()->hasTable('rsthemes_pages_sections_cache')) 
                {
                    \WHMCS\Database\Capsule::schema()->create('rsthemes_pages_sections_cache', function($table)
                    {
                        $table->increments('id');
                        $table->integer('section')->unsigned();
                        $table->foreign('section')->references('id')->on('rsthemes_page_sections')->onDelete('cascade');
                        $table->string('lang');
                        $table->string('iconType');
                        $table->integer('currency');
                        $table->mediumText('html')->nullable();
                        $table->timestamps();
                    });
                }
                parent::loadConfig();
            }
        }
        /**
         * Extension Deactivate
         */
        public function removeConfig()
        {
            if(\WHMCS\Database\Capsule::schema()->hasTable('rsthemes_pages_sections_cache')) 
            {
                \WHMCS\Database\Capsule::schema()->drop('rsthemes_pages_sections_cache');
            }
            if(isset($_GET['delete'])) 
            {
                $cache = \RSThemes\Models\HtmlCache::where('name', 'LIKE', 'navbar_cache_%')->get();
                foreach( $cache as $delCache ) 
                {
                    $delCache->delete();
                }
                $pagesToDelete = \RSThemes\Models\Page::where('custom_page', 1)->get();
                foreach( $pagesToDelete as $page ) 
                {
                    foreach( $page->sections as $section ) 
                    {
                        foreach( $section->translations as $translation ) 
                        {
                            $translation->delete();
                        }
                        $section->delete();
                    }
                    $pageFile = ROOTDIR . DS . $page->settings['filename'];
                    if(file_exists($pageFile)) 
                    {
                        unlink($pageFile);
                    }
                    $htaccess = ROOTDIR . DS . '.htaccess';
                    \RSThemes\Helpers\FileHelper::removeFileLineWithString($htaccess, '#custom-page-' . $page->id);
                    \RSThemes\Helpers\PagesHelper::updateHomepageRedirection();
                    $page->delete();
                }
                (new \RSThemes\Migrations\Version_2_0\SectionMigrator())->down();
                (new \RSThemes\Models\Configuration())->removeConfig($this->template->getMainName() . '_pages_created', 'no');
                $delSettings = \RSThemes\Models\Settings::where('setting', $this->template->getMainName() . '_custompage_homepage_id');
                $delSettings->delete();
                $CMSdisplay = \RSThemes\Models\Display::where('name', 'CMS')->first();
                if($CMSdisplay) 
                {
                    $displayRules = \RSThemes\Models\DisplayRule::where('display_id', $CMSdisplay->id)->get();
                    foreach( $displayRules as $delRule ) 
                    {
                        $delRule->delete();
                    }
                }
                $CMSdisplay->delete();
            }
            $display = \RSThemes\Models\Display::where('name', 'default')->first();
            $displayProcessor = new \RSThemes\Processors\DisplayProcessor();
            $displayProcessor->setActiveDisplay($display->id);
            \RSThemes\Helpers\PagesHelper::changePageRedirectionStatus(false);
            file_put_contents(ROOTDIR . '/sitemap.xml', '');
            parent::removeConfig();
        }
        public function checkLicense()
        {
            if(isset(self::$isLicensed)) 
            {
                return self::$isLicensed;
            }
            $minVerion = '2.1.1';
            if($this->template->license->template == null) 
            {
                return 'success';
            }
            $allowed = version_compare($this->template->license->template->getVersion(), $minVerion);
            if($allowed == '-1') 
            {
                return 'Lagom update is required';
            }
            $allowedExtensions = $this->template->license->getAllowedExtensions();
            foreach( $allowedExtensions as $allowedExtensionName ) 
            {
                if($allowedExtensionName == $this->name) 
                {
                    return 'success';
                }
            }
            return 'success';
        }
    }

}

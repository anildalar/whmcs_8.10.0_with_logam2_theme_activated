<?php

return [
    'default_type' => true,
    'name' => 'Compare Packages',
    'slug' => 'compare-packages',
    'comingsoon' => true,
    'thumb' => 'thumb.png',
    'fields' => [
        [
            'type' => 'text',
            'name' => 'title',
            'label' => 'Title'
        ],
        [
            'type' => 'textarea',
            'name' => 'subtitle',
            'label' => 'Sub-title'
        ],
        [
            'type' => 'group-input',
            'name' => 'compare_plans',
            'label' => 'Products Group',
            'grouped' => true, // value which is used to setup init style of group input
            'group_forced' => false, // value which is used to show/hide group select
            'fields' => [ //list of inputs which are looped to the groups
                [
                    'type' => 'product',
                    'name' => 'products_list',
                    'label' => 'Products'
                ],
            ]
        ],
        [
            'type' => 'text',
            'name' => 'products_custom_classes',
            'label' => 'Products Custom Class'
        ],
        [
            'type' => 'buttons',
            'name' => 'buttons',
            'label' => 'Section Actions'
        ],
        [
            'type' => 'text',
            'name' => 'section_anchor',
            'label' => 'Section anchor',
            'placeholder' => 'Enter anchor...',
            'tooltip' => 'Lorem Ipsum <a href="#">Learn More</a>'
        ],
        [
            'type' => 'text',
            'name' => 'custom_class',
            'label' => 'Section Custom Class'
        ]
    ]
];

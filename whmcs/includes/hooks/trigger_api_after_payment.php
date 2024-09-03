<?php
use WHMCS\Database\Capsule;

add_hook('InvoicePaid', 1, function($vars) {
    // Get the invoice ID
    $invoiceId = $vars['invoiceid'];

    // Retrieve the invoice details
    $invoiceData = Capsule::table('tblinvoices')->where('id', $invoiceId)->first();

    // Retrieve the client details
    $clientId = $invoiceData->userid;
    $clientData = Capsule::table('tblclients')->where('id', $clientId)->first();

    // Prepare the API request data
    $apiData = [
        'invoice_id' => $invoiceId,
        'client_id' => $clientId,
        'amount' => $invoiceData->total,
        'currency' => $invoiceData->currency,
        'client_email' => $clientData->email,
        // Add other data as needed
    ];

    // Convert the data to JSON format
    $jsonData = json_encode($apiData);

    $username = getenv('JENKINN_USERNAME');
    $password = getenv('JENKINN_API_KEY');
    $url = "https://example.com/job/PBXDeploye/buildWithParameters";

    // Prepare the parameters
    $parameters = [
        'pbxname' => $newSubDomainName,
        'Environment' => 'Production',
        'plan_value_sipuser' => $transactionAmount,
        'stripeId' => $paymentIntent,
        'country_code' => $countryCode,
        'country_state' => $countryState,
        'TZ' => $timezone
    ];

    // Initialize cURL
    $ch = curl_init();

    // Set the URL with parameters
    curl_setopt($ch, CURLOPT_URL, $url . '?' . http_build_query($parameters));

    // Set the HTTP method to POST
    curl_setopt($ch, CURLOPT_POST, true);

    // Enable returning the transfer as a string
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);

    // Set up the basic authentication
    curl_setopt($ch, CURLOPT_USERPWD, "$username:$password");

    // Execute the cURL request
    $response = curl_exec($ch);

    // Check for errors
    if (curl_errno($ch)) {
        $error_msg = curl_error($ch);
        logActivity("Jenkins API call failed: $error_msg");
    } else {
        $httpcode = curl_getinfo($ch, CURLINFO_HTTP_CODE);
        if ($httpcode != 201) {
            logActivity("Jenkins API call returned HTTP code $httpcode: $response");
        } else {
            logActivity("Jenkins API call successful: $response");
        }
    }

    // Close the cURL session
    curl_close($ch);

    // Optionally log the response or any errors
    logActivity('API call triggered after payment: ' . $response);
});

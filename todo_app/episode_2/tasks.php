<?php
$filename = 'tasklist.txt';
header("Content-Type: application/json");

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $content = file_get_contents('php://input');
    $tasks = json_decode($content, true);

    if ($tasks === null) {
	// Handle invalid JSON format
	// Once the file is in use, it will contain [] and not be empty
        if (file_exists($filename) && filesize($filename) > 0) {
            $tasks = json_decode(file_get_contents($filename), true);
        } else {
            $tasks = [];
        }
        echo json_encode(["error" => "Invalid JSON format"]);
        http_response_code(400);
        exit;
    }

    if (file_put_contents($filename, json_encode($tasks)) === false) {
	    file_put_contents(
                "error.log",
		"Failed to write to file: $filename\n",
		FILE_APPEND
	    );
        echo json_encode(["error" => "Failed to save tasks"]);
        http_response_code(500);
        exit;
    }

    echo json_encode(["message" => "Tasks saved successfully."]);
    exit;
}

if ($_SERVER['REQUEST_METHOD'] === 'GET') {
    if (file_exists($filename) && filesize($filename) > 0) {
        $tasks = file_get_contents($filename);
        echo $tasks;
    } else {
        echo json_encode([]);
    }
    exit;
}
?>

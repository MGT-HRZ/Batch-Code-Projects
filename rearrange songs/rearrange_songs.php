<?php

//  WARNING!!! THE CODE NEEDS LOCALHOST TO RUN

require_once 'src/getID3-master/getID3/getID3.php';

// Function to move files into decade folders
function rearrangeSongsIntoDecades($sourceDir, $destinationDir)
{
    $getID3 = new getID3();

    $songList = glob($sourceDir . '/*.mp3');
    foreach ($songList as $song) {
        $audioInfo = $getID3->analyze($song);
        if (isset($audioInfo['tags']['id3v2'])) {
            $year = $audioInfo['tags']['id3v2']['year'][0];
            if ($year && is_numeric($year) && strlen($year) === 4) {
                $decade = floor($year / 10) * 10;

                // Create decade folder if it doesn't exist
                $decadeDir = $destinationDir . ' - ' . $decade . 's';   //  With directory filename

                if (!file_exists($decadeDir)) {
                    mkdir($decadeDir, 0777, true);
                }

                // Move the song to the decade folder (without its original folder name)
                $destFilePath = $decadeDir . '/' . basename($song);
                rename($song, $destFilePath);
            }
        }
    }
}

// Check if the correct number of arguments is provided
if ($argc !== 3) {
    echo "Usage: php rearrange_songs.php [source_directory] [destination_directory]\n";
    exit(1);
}

$sourceDir = $argv[1];
$destinationDir = $argv[2];

// Check if the source directory exists
if (!is_dir($sourceDir)) {
    echo "Error: Source directory not found.\n";
    exit(1);
}

// Check if the destination directory exists, if not create it
if (!file_exists($destinationDir)) {
    mkdir($destinationDir, 0777, true);
}

rearrangeSongsIntoDecades($sourceDir, $destinationDir);

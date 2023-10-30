<?php

function copyFolderStructure($source, $destination)
{
    if (is_dir($source)) {
        if (!is_dir($destination)) {
            mkdir($destination, 0777, true);
        }

        $dirContents = scandir($source);
        foreach ($dirContents as $item) {
            if ($item != '.' && $item != '..') {
                $sourcePath = $source . '/' . $item;
                $destPath = $destination . '/' . $item;

                if (is_dir($sourcePath)) {
                    copyFolderStructure($sourcePath, $destPath);
                }
            }
        }
    }
}

// Usage:
$sourceDirectory = $argv[1];
$destinationDirectory = $argv[2];

copyFolderStructure($sourceDirectory, $destinationDirectory);

<?php


function quickSort($array)
{
    if(sizeof($array) <= 1) {
        return $array;
    }
    $pivot = $array[0];

    $left = $right = array();

    for ($i = 1;$i < sizeof($array);$i++) {
        if($array[$i] < $pivot) {
            $left[] = $array[$i];
        } else {
            $right[] = $array[$i];
        }
    }

    return array_merge(quickSort($left), array($pivot), quickSort($right));
}

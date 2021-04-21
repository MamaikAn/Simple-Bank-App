<?php 
    $xw = new XMLWriter();
    $xw->openMemory();
    $xw->setIndent(TRUE);
    $xw->startDocument("1.0", "UTF-8");

    $xw->writeELement('abc', 'abc');

    $xw->endDocument();

    $xml = new DOMDocument();
    $xml->loadXML($xw->flush());

    $xsl = new DOMDocument();
    $xsl->load(__HOST__.'/resources/main.xsl');

    $proc = new XSLTProcessor;
    $proc->importStyleSheet($xsl);

    echo $proc->transformToDoc($xml)->saveHTML();
?>
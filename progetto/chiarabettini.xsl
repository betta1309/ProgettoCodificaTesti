<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns="http://www.w3.org/1999/xhtml">
	<xsl:output method="html" indent="yes" />
	<xsl:template match="/">
		<html>
			<head>
				<title>
					<xsl:value-of select="tei:teiCorpus/tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title" />
				</title>
				<meta charset="UTF-8"/>
				<link rel="stylesheet" type="text/css" href="style.css" />
				<link href="https://fonts.googleapis.com/css?family=Lekton|Montserrat" rel="stylesheet" /> 
				<script src="script.js" />
			</head>
			<body>
				<header>
					<nav>
						<a href="#home">Home</a>
						<a href="#c161">Bambini in barca</a>
						<a href="#c224">Coppia su slittino</a>
						<a href="#credits">Credits</a>
					</nav>
				</header>

				<!--div della home-->
				<div id="home" class="sezione">
					<h1>Cartoline</h1>
					<div class="solotesto">
						<p>Le cartoline presentate su questa pagina sono state codificate per il <xsl:value-of select="tei:teiCorpus/tei:teiHeader/tei:fileDesc/tei:publicationStmt/tei:p" />.</p>
						<p>Le cartoline risalgono alla Prima Guerra Mondiale: una, molto breve, di saluti; l'altra una lettera d'amore.</p>
						<p>Le cartoline sono conservate presso il <xsl:value-of select="tei:teiCorpus/tei:TEI/tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:msDesc/tei:msIdentifier/tei:repository" />, <xsl:value-of select="tei:teiCorpus/tei:TEI/tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:msDesc/tei:msIdentifier/tei:settlement" />.</p>
						<p>Le persone che vengono nominate in queste cartoline sono:</p>
						<xsl:apply-templates select="tei:teiCorpus/tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:listPerson" />
						<h3>Nota sui testi</h3>
						<h4>Doppia s</h4>
						<p><em><xsl:value-of select="tei:teiCorpus/tei:teiHeader/tei:encodingDesc/tei:charDecl/tei:char/tei:charName" /></em>: <xsl:value-of select="tei:teiCorpus/tei:teiHeader/tei:encodingDesc/tei:charDecl/tei:char/tei:note" /></p>

					</div>
				</div>

				<div id="c161" class="sezione">
					<h2>Bambini in barca</h2>
					<xsl:apply-templates select="tei:teiCorpus/tei:TEI[@xml:id='c161']" />
				</div>
				<div id="c224" class="sezione">
					<h2>Coppia su slittino</h2>
					<xsl:apply-templates select="tei:teiCorpus/tei:TEI[@xml:id='c224']" />
				</div>

				<!--div dei credits-->
				<div id="credits" class="sezione">
					<h1>Credits</h1>
					<div class="solotesto">
						<p>Codifica realizzata da <xsl:value-of select="tei:teiCorpus/tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:respStmt/tei:name"/> per l'esame di febbraio 2020 di Codifica di testi.</p>
						<p>Ottimizzato per Firefox 72 (desktop).</p>
					</div>
				</div>
			</body>
		</html>
	</xsl:template>


	<xsl:template match="//tei:TEI">
		<xsl:variable name="id" select="./@xml:id" />
		<div class="container">
			<div class="immagine fronte">
				<xsl:element name="img">
					<xsl:attribute name="src">
						<xsl:value-of select="./tei:facsimile/tei:surfaceGrp/tei:surface[@xml:id=concat($id,'_fronte')]/tei:graphic/@url" />
					</xsl:attribute>
					<xsl:attribute name="id">
						<xsl:value-of select="concat($id,'_fronte')" />
					</xsl:attribute>
					<xsl:attribute name="alt">
						<xsl:value-of select="./tei:text/tei:body/tei:div[@type='fronte']/tei:figure/tei:figDesc" />
					</xsl:attribute>
					<xsl:attribute name="height">
						<xsl:value-of select="substring-before(./tei:facsimile/tei:surfaceGrp/tei:surface[@xml:id=concat($id,'_fronte')]/tei:graphic/@height, 'px')" />
					</xsl:attribute>
					<xsl:attribute name="width">
						<xsl:value-of select="substring-before(./tei:facsimile/tei:surfaceGrp/tei:surface[@xml:id=concat($id,'_fronte')]/tei:graphic/@width, 'px')" />
					</xsl:attribute>
					<!--dimensioni-->
				</xsl:element>
			</div>
			<div class="testo fronte">
				<h3>
					<xsl:value-of select="./tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title"/>
				</h3>
				<h4>Informazioni editoriali</h4>
				<p><ul>
					<li>Titolo: <em><xsl:value-of select="./tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:bibl/tei:title" /></em></li>
					<li>Data: <em><xsl:value-of select="./tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:bibl/tei:date" /></em></li>
				</ul></p>
				<h4>Collocazione e stato</h4>
					<xsl:apply-templates select="./tei:teiHeader/tei:fileDesc" />
				<h4>Luoghi</h4>
				<ul>
					<li><xsl:value-of select="//tei:teiCorpus/tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:listPlace/tei:place/tei:placeName" /> (<xsl:value-of select="//tei:teiCorpus/tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:listPlace/tei:place/tei:district[@type='provincia']" />)</li>
					<li><xsl:value-of select="./tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:listPlace/tei:place/tei:placeName" /> (<xsl:value-of select="./tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:listPlace/tei:place/tei:district[@type='provincia']" />)</li>
				</ul>
				<xsl:if test="$id='c161'">
					<h4>Testo fronte</h4>
					<xsl:value-of select=".//tei:div[@type='fronte']/tei:p" />
				</xsl:if>
			</div>
		</div>
		<div class="container">
			<div class="immagine retro">
				<xsl:element name="img">
					<xsl:attribute name="src">
						<xsl:value-of select="./tei:facsimile/tei:surfaceGrp/tei:surface[@xml:id=concat($id,'_retro')]/tei:graphic/@url" />
					</xsl:attribute>
					<xsl:attribute name="id">
						<xsl:value-of select="concat($id,'_retro')" />
					</xsl:attribute>
					<xsl:attribute name="usemap">
						<xsl:value-of select="concat('#',$id,'_r')" />
					</xsl:attribute>
					<xsl:attribute name="height">
						<xsl:value-of select="substring-before(./tei:facsimile/tei:surfaceGrp/tei:surface[@xml:id=concat($id,'_retro')]/tei:graphic/@height, 'px')" />
					</xsl:attribute>
					<xsl:attribute name="width">
						<xsl:value-of select="substring-before(./tei:facsimile/tei:surfaceGrp/tei:surface[@xml:id=concat($id,'_retro')]/tei:graphic/@width, 'px')" />
					</xsl:attribute>
				</xsl:element>
				<xsl:element name="map">
					<xsl:attribute name="name">
						<xsl:value-of select="concat($id,'_r')" />
					</xsl:attribute>
					<xsl:call-template name="zone">
						<xsl:with-param name="id" select="$id" />
					</xsl:call-template>
				</xsl:element>	
			</div>

			<div class="testo retro">

				<xsl:for-each select="./tei:text/tei:body/tei:div[@type='retro']/tei:div">
					<xsl:choose>
						<xsl:when test="@type='testo'">
							<h4>Testo</h4>
							<xsl:element name="div">
								<xsl:attribute name="class">
									<xsl:value-of select="substring-after(.//tei:opener/@facs, '#')" />
								</xsl:attribute>
								<p><xsl:value-of select=".//tei:opener/tei:dateline" /></p>
								<p><xsl:value-of select=".//tei:opener/tei:salute" /></p>
							</xsl:element>
							<xsl:apply-templates select=".//tei:p" />
							<xsl:apply-templates select=".//tei:closer" />
						</xsl:when>
						<xsl:when test="@type='indirizzo'">
							<h4>Indirizzo</h4>
							<xsl:element name="div">
								<xsl:attribute name="class">
									<xsl:value-of select="substring-after(@facs, '#')" />
								</xsl:attribute>
								<xsl:for-each select="./tei:ab/tei:address/tei:addrLine">
									<p><xsl:value-of select="." /></p>
								</xsl:for-each>
							</xsl:element>
						</xsl:when>
						<xsl:when test="@type='stampato'">
							<h4>Elementi stampati</h4>
							<ul>
								<xsl:for-each select="./tei:ab">
									<xsl:element name="li">
										<xsl:value-of select="."/>
									</xsl:element>
								</xsl:for-each>
							</ul>
						</xsl:when>
						<xsl:when test="@type='affrancatura'">
							<h4>Affrancatura</h4>
							<xsl:for-each select="./tei:ab/tei:stamp">
								<ul>
									<xsl:element name="li">
										<xsl:value-of select="." />
									</xsl:element>
								</ul>
							</xsl:for-each>
						</xsl:when>
						<xsl:when test="@type='addizione'">
							<xsl:element name="p">
								Numero di catalogo (aggiunta di altra mano): <em><xsl:value-of select=".//tei:num" /></em>
							</xsl:element>
						</xsl:when>
					</xsl:choose>
				</xsl:for-each>
			</div>
		</div>
	</xsl:template>



	<xsl:template match="//tei:listPerson">
		<ul>
			<xsl:for-each select="./tei:person">
				<li>
					<xsl:value-of select=".//tei:forename" /><xsl:if test=".//tei:surname"><xsl:text> </xsl:text><xsl:value-of select=".//tei:surname" /></xsl:if> (<xsl:value-of select="./tei:sex" />)<xsl:if test="./tei:occupation!=''" >, <xsl:value-of select="./tei:occupation" /></xsl:if>
				</li>
			</xsl:for-each>
		</ul>
	</xsl:template>

	<xsl:template match="//tei:fileDesc">
		<ul>
			<li>Codice identificativo: <em><xsl:value-of select="./tei:sourceDesc/tei:msDesc/tei:msIdentifier/tei:idno" /></em></li>
			<li>Stato: <em><xsl:value-of select="./tei:sourceDesc/tei:msDesc/tei:physDesc/tei:objectDesc/tei:supportDesc/tei:condition" /></em></li>
			<li>Dimensioni: <xsl:value-of select="./tei:sourceDesc/tei:msDesc/tei:physDesc/tei:objectDesc/tei:supportDesc/tei:support/tei:dimensions/tei:height" />x<xsl:value-of select="./tei:sourceDesc/tei:msDesc/tei:physDesc/tei:objectDesc/tei:supportDesc/tei:support/tei:dimensions/tei:width" /> cm</li>
		</ul>
	</xsl:template>	

	<xsl:template name="zone" match="//tei:TEI/tei:facsimile/tei:surfaceGrp">
		<xsl:param name="id" />
		<xsl:for-each select="//tei:surface[@xml:id=concat($id,'_retro')]/tei:zone">
			<xsl:element name="area">
				<xsl:attribute name="id">
					<xsl:value-of select="./@xml:id" />
				</xsl:attribute>
				<xsl:attribute name="shape">rect</xsl:attribute>
				<xsl:attribute name="coords">
					<xsl:value-of select="./@ulx" />,<xsl:value-of select="./@uly" />,<xsl:value-of select="./@lrx" />,<xsl:value-of select="./@lry" />
				</xsl:attribute>
			</xsl:element>
		</xsl:for-each>
	</xsl:template>

	<xsl:template match="//tei:p">
		<xsl:element name="p">
			<xsl:attribute name="class">
				<xsl:value-of select="substring-after(./@facs, '#')" />
			</xsl:attribute>
			<xsl:for-each select="./node()">
				<xsl:choose>
					<xsl:when test="tei:pc">
						<span title="trattino a capo"><xsl:value-of select="text()[1]" /><xsl:value-of select="text()[2]" /></span>
					</xsl:when>
					<xsl:otherwise><xsl:value-of select="." /></xsl:otherwise>
				</xsl:choose>
				
			</xsl:for-each>
		</xsl:element>
	</xsl:template>

	<xsl:template match="//tei:closer">
		<xsl:element name="div">
			<xsl:attribute name="class">
				<xsl:value-of select="substring-after(@facs, '#')" />
			</xsl:attribute>
			<xsl:if test="./tei:salute">
				<p><xsl:value-of select="./tei:salute" /></p>
			</xsl:if>
			<p><xsl:value-of select="./tei:signed" /></p>
		</xsl:element>
	</xsl:template>

</xsl:stylesheet>
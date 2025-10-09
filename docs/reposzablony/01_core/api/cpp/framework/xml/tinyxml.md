---
doc_id: "cpp-api-92c38a6197ab"
source_path: "framework/xml/tinyxml.h"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:28:07Z"
doc_class: "api"
language: "pl"
title: "API: tinyxml.h"
summary: "Dokumentacja API C++ dla framework/xml/tinyxml.h"
tags: ["cpp", "api", "otclient"]
---

# framework/xml/tinyxml.h

## Overview

Plik nagłówkowy C++ zawierający definicje dla modułu tinyxml.

## Classes/Structs

### Klasa: `TiXmlDocument`

### Klasa: `TiXmlElement`

### Klasa: `TiXmlComment`

### Klasa: `TiXmlUnknown`

### Klasa: `TiXmlAttribute`

### Klasa: `TiXmlText`

### Klasa: `TiXmlDeclaration`

### Klasa: `TiXmlParsingData`

### Struktura: `TiXmlCursor`

Internal structure for tracking location of items in the XML file.

### Klasa: `to`

| Member | Brief | Signature |
|--------|-------|-----------|
| `VisitEnter` | Visit a document. | `virtual bool VisitEnter( const TiXmlDocument& /*doc*/ )            { return true; }` |
| `VisitExit` | virtual bool VisitEnter( const TiXmlDocument& doc )            { return true; } Visit a document. | `virtual bool VisitExit( const TiXmlDocument& /*doc*/ )            { return true; }` |
| `VisitEnter` | virtual bool VisitExit( const TiXmlDocument& doc )            { return true; } Visit an element. | `virtual bool VisitEnter( const TiXmlElement& /*element*/, const TiXmlAttribute* /*firstAttribute*/ )    { return true; }` |
| `VisitExit` | virtual bool VisitEnter( const TiXmlElement& element, const TiXmlAttribute* firstAttribute )    { re | `virtual bool VisitExit( const TiXmlElement& /*element*/ )        { return true; }` |
| `Visit` | virtual bool VisitExit( const TiXmlElement& element )        { return true; } Visit a declaration | `virtual bool Visit( const TiXmlDeclaration& /*declaration*/ )    { return true; }` |
| `Visit` | virtual bool Visit( const TiXmlDeclaration& declaration )    { return true; } Visit a text node | `virtual bool Visit( const TiXmlText& /*text*/ )                    { return true; }` |
| `Visit` | virtual bool Visit( const TiXmlText& text )                    { return true; } Visit a comment node | `virtual bool Visit( const TiXmlComment& /*comment*/ )            { return true; }` |
| `Visit` | virtual bool Visit( const TiXmlComment& comment )            { return true; } Visit an unknown node | `virtual bool Visit( const TiXmlUnknown& /*unknown*/ )            { return true; }` |

### Klasa: `TiXmlVisitor`

Implements the interface to the "Visitor pattern" (see the Accept() method.) If you call the Accept() method, it requires being passed a TiXmlVisitor class to handle callbacks. For nodes that contain other nodes (Document, Element) you will get called with a VisitEnter/VisitExit pair. Nodes that are always leaves are simply called with Visit().  If you return 'true' from a Visit method, recursive parsing will continue. If you return false, <b>no children of this node or its sibilings</b> will be Visited.  All flavors of Visit methods have a default implementation that returns 'true' (continue visiting). You need to only override methods that are interesting to you.  Generally Accept() is called on the TiXmlDocument, although all nodes suppert Visiting.  You should never change the document from a callback.  @sa TiXmlNode::Accept()

| Member | Brief | Signature |
|--------|-------|-----------|
| `VisitEnter` | Visit a document. | `virtual bool VisitEnter( const TiXmlDocument& /*doc*/ )            { return true; }` |
| `VisitExit` | virtual bool VisitEnter( const TiXmlDocument& doc )            { return true; } Visit a document. | `virtual bool VisitExit( const TiXmlDocument& /*doc*/ )            { return true; }` |
| `VisitEnter` | virtual bool VisitExit( const TiXmlDocument& doc )            { return true; } Visit an element. | `virtual bool VisitEnter( const TiXmlElement& /*element*/, const TiXmlAttribute* /*firstAttribute*/ )    { return true; }` |
| `VisitExit` | virtual bool VisitEnter( const TiXmlElement& element, const TiXmlAttribute* firstAttribute )    { re | `virtual bool VisitExit( const TiXmlElement& /*element*/ )        { return true; }` |
| `Visit` | virtual bool VisitExit( const TiXmlElement& element )        { return true; } Visit a declaration | `virtual bool Visit( const TiXmlDeclaration& /*declaration*/ )    { return true; }` |
| `Visit` | virtual bool Visit( const TiXmlDeclaration& declaration )    { return true; } Visit a text node | `virtual bool Visit( const TiXmlText& /*text*/ )                    { return true; }` |
| `Visit` | virtual bool Visit( const TiXmlText& text )                    { return true; } Visit a comment node | `virtual bool Visit( const TiXmlComment& /*comment*/ )            { return true; }` |
| `Visit` | virtual bool Visit( const TiXmlComment& comment )            { return true; } Visit an unknown node | `virtual bool Visit( const TiXmlUnknown& /*unknown*/ )            { return true; }` |

### Klasa: `TiXmlBase`

TiXmlBase is a base class for every class in TinyXml. It does little except to establish that TinyXml classes can be printed and provide some utility functions.  In XML, the document and elements can contain other elements and other types of nodes.  @verbatim A Document can contain:    Element    (container or leaf) Comment (leaf) Unknown (leaf) Declaration( leaf )  An Element can contain:    Element (container or leaf) Text    (leaf) Attributes (not on tree) Comment (leaf) Unknown (leaf)  A Decleration contains: Attributes (not on tree) @endverbatim

| Member | Brief | Signature |
|--------|-------|-----------|
| `operator` |  | `void operator=( const TiXmlBase& base ) = delete` |
| `Print` | All TinyXml classes can print themselves to a filestream or the string class (TiXmlString in non-STL | `virtual void Print( FILE* cfile, int depth ) const = 0` |
| `SetCondenseWhiteSpace` | The world does not agree on whether white space should be kept or not. In order to make everyone hap | `static void SetCondenseWhiteSpace( bool condense )        { condenseWhiteSpace = condense; }` |
| `IsWhiteSpaceCondensed` | Return the current white space setting. | `static bool IsWhiteSpaceCondensed()                        { return condenseWhiteSpace; }` |
| `Row` | Return the position, in the original source file, of this node or attribute. The row and column are  | `int Row() const            { return location.row + 1; }` |
| `Column` |  | `int Column() const        { return location.col + 1; }    ///< See Row()` |
| `SetUserData` |  | `void  SetUserData( void* user )            { userData = user; }    ///< Set a pointer to arbitrary user data.` |
| `EncodeString` | Expands entities in a string. Note this should not contian the tag's '<', '>', etc, or they will be  | `static void EncodeString( const TIXML_STRING& str, TIXML_STRING* out )` |
| `IsWhiteSpace` |  | `return IsWhiteSpace( (char) c )` |
| `false` |  | `return false;    // Again, only truly correct for English/Latin...but usually works.` |
| `StreamWhiteSpace` |  | `static bool    StreamWhiteSpace( std::istream * in, TIXML_STRING * tag )` |
| `StreamTo` |  | `static bool StreamTo( std::istream * in, int character, TIXML_STRING * tag )` |
| `GetEntity` |  | `return GetEntity( p, _value, length, encoding )` |
| `if` |  | `else if ( *length )` |
| `0` |  | `return 0` |
| `location` |  | `TiXmlCursor location` |
| `IsAlpha` |  | `static int IsAlpha( unsigned char anyByte, TiXmlEncoding encoding )` |
| `IsAlphaNum` |  | `static int IsAlphaNum( unsigned char anyByte, TiXmlEncoding encoding )` |
| `v` |  | `return v` |
| `tolower` |  | `return tolower( v )` |
| `ConvertUTF32ToUTF8` |  | `static void ConvertUTF32ToUTF8( unsigned long input, char* output, int* length )` |

### Struktura: `Entity`

### Klasa: `TiXmlNode`

The parent class for everything in the Document Object Model. (Except for attributes). Nodes have siblings, a parent, and children. A node can be in a document, or stand on its own. The type of a TiXmlNode can be queried, and it can be cast to its more defined type.

| Member | Brief | Signature |
|--------|-------|-----------|
| `operator` |  | `void operator=( const TiXmlNode& base ) = delete` |
| `TiXmlElement` |  | `a TiXmlElement (for example) and read that from an input stream,` |
| `SetValue` | Changes the value of the node. Defined as: @verbatim Document:    filename of the xml file Element:  | `void SetValue(const char * _value) { value = _value;}` |
| `SetValue` | STL std::string form. | `void SetValue( const std::string& _value )    { value = _value; }` |
| `Clear` | Delete all the children of this node. Does not affect 'this'. | `void Clear()` |
| `owned` |  | `henceforth owned (and deleted) by tinyXml. This method is efficient` |
| `RemoveChild` | Delete a child of this node. | `bool RemoveChild( TiXmlNode* removeThis )` |
| `Type` | Query the type (as an enumerated value, above) of this node. The possible types are: TINYXML_DOCUMEN | `int Type() const    { return type; }` |
| `NoChildren` | Returns true if this node has no children. | `bool NoChildren() const                        { return !firstChild; }` |
| `printer` |  | `TiXmlPrinter printer` |
| `Accept` | Accept a hierchical visit the nodes in the TinyXML DOM. Every node in the XML tree will be condition | `virtual bool Accept( TiXmlVisitor* visitor ) const = 0` |
| `CopyTo` |  | `void CopyTo( TiXmlNode* target ) const` |
| `StreamIn` |  | `virtual void StreamIn( std::istream* in, TIXML_STRING* tag ) = 0` |
| `type` |  | `NodeType        type` |
| `value` |  | `TIXML_STRING    value` |

### Klasa: `TiXmlAttribute`

An attribute is a name-value pair. Elements have an arbitrary number of attributes, each with a unique name.  @note The attributes are not TiXmlNodes, since they are not part of the tinyXML document object model. There are other suggested ways to look at this problem.

| Member | Brief | Signature |
|--------|-------|-----------|
| `IntValue` |  | `int                IntValue() const;                                    ///< Return the value of this attribute, converted to an integer.` |
| `DoubleValue` |  | `double            DoubleValue() const;                                ///< Return the value of this attribute, converted to a double.` |
| `QueryIntValue` | QueryIntValue examines the value string. It is an alternative to the IntValue() method with richer e | `int QueryIntValue( int* _value ) const` |
| `QueryDoubleValue` | QueryDoubleValue examines the value string. See QueryIntValue(). | `int QueryDoubleValue( double* _value ) const` |
| `SetName` |  | `void SetName( const char* _name )    { name = _name; }                ///< Set the name of this attribute.` |
| `SetValue` |  | `void SetValue( const char* _value )    { value = _value; }                ///< Set the value.` |
| `SetIntValue` |  | `void SetIntValue( int _value );                                        ///< Set the value from an integer.` |
| `SetDoubleValue` |  | `void SetDoubleValue( double _value );                                ///< Set the value from a double.` |
| `SetName` | STL std::string form. | `void SetName( const std::string& _name )    { name = _name; }` |
| `SetValue` | STL std::string form. | `void SetValue( const std::string& _value )    { value = _value; }` |
| `operator` |  | `bool operator==( const TiXmlAttribute& rhs ) const { return rhs.name == name; }` |
| `Print` |  | `virtual void Print( FILE* cfile, int depth ) const {` |
| `Print` |  | `void Print( FILE* cfile, int depth, TIXML_STRING* str ) const` |
| `SetDocument` |  | `void SetDocument( TiXmlDocument* doc )    { document = doc; }` |

### Klasa: `TiXmlAttributeSet`

A class used to manage a group of attributes. It is only used internally, both by the ELEMENT and the DECLARATION.  The set can be changed transparent to the Element and Declaration classes that use it, but NOT transparent to the Attribute which has to implement a next() and previous() method. Which makes it a bit problematic and prevents the use of STL.  This version is implemented with circular lists because: - I like circular lists - it demonstrates some independence from the (typical) doubly linked list.

| Member | Brief | Signature |
|--------|-------|-----------|
| `Add` |  | `void Add( TiXmlAttribute* attribute )` |
| `Remove` |  | `void Remove( TiXmlAttribute* attribute )` |

### Klasa: `TiXmlElement`

The element is a container class. It has a value, the element name, and can contain other elements, text, comments, and unknowns. Elements also contain an arbitrary number of attributes.

| Member | Brief | Signature |
|--------|-------|-----------|
| `readType` |  | `inline T readType(const std::string& str) const` |
| `ret` |  | `T ret` |
| `r` |  | `int r = QueryValueAttribute(str, &ret)` |
| `T` |  | `return T()` |
| `ret` |  | `return ret` |
| `TIXML_NO_ATTRIBUTE` |  | `return TIXML_NO_ATTRIBUTE` |
| `sstream` |  | `std::stringstream sstream( node->ValueStr() )` |
| `TIXML_SUCCESS` |  | `return TIXML_SUCCESS` |
| `TIXML_WRONG_TYPE` |  | `return TIXML_WRONG_TYPE` |
| `QueryValueAttribute` |  | `int QueryValueAttribute( const std::string& name, std::string* outValue ) const` |
| `TIXML_NO_ATTRIBUTE` |  | `return TIXML_NO_ATTRIBUTE` |
| `TIXML_SUCCESS` |  | `return TIXML_SUCCESS` |
| `Attribute` |  | `std::string Attribute( const std::string& name ) const` |
| `Attribute` |  | `std::string Attribute( const std::string& name, int* i ) const` |
| `Attribute` |  | `std::string Attribute( const std::string& name, double* d ) const` |
| `SetAttribute` |  | `void SetAttribute( const std::string& name, const std::string& _value )` |
| `SetAttribute` |  | `void SetAttribute( const std::string& name, int _value) { SetAttribute(name, stdext::to_string(_value)); }` |
| `RemoveAttribute` |  | `void RemoveAttribute( const std::string& name )` |
| `GetText` |  | `WARNING: GetText() accesses a child node - don't become confused with the` |
| `Print` |  | `virtual void Print( FILE* cfile, int depth ) const` |
| `Accept` | Walk the XML tree visiting this node and all of its children. | `virtual bool Accept( TiXmlVisitor* visitor ) const` |
| `CopyTo` |  | `void CopyTo( TiXmlElement* target ) const` |
| `ClearThis` |  | `void ClearThis();    // like clear, but initializes 'this' object as well` |
| `StreamIn` |  | `virtual void StreamIn( std::istream * in, TIXML_STRING * tag )` |

### Klasa: `TiXmlComment`

An XML comment.

| Member | Brief | Signature |
|--------|-------|-----------|
| `Print` |  | `virtual void Print( FILE* cfile, int depth ) const` |
| `Accept` | Walk the XML tree visiting this node and all of its children. | `virtual bool Accept( TiXmlVisitor* visitor ) const` |
| `CopyTo` |  | `void CopyTo( TiXmlComment* target ) const` |
| `StreamIn` |  | `virtual void StreamIn( std::istream * in, TIXML_STRING * tag )` |

### Klasa: `TiXmlText`

XML text. A text node can have 2 ways to output the next. "normal" output and CDATA. It will default to the mode it was parsed from the XML file and you generally want to leave it alone, but you can change the output mode with SetCDATA() and query it with CDATA().

| Member | Brief | Signature |
|--------|-------|-----------|
| `Print` |  | `virtual void Print( FILE* cfile, int depth ) const` |
| `CDATA` | Queries whether this represents text using a CDATA section. | `bool CDATA() const                { return cdata; }` |
| `SetCDATA` | Turns on or off a CDATA representation of text. | `void SetCDATA( bool _cdata )    { cdata = _cdata; }` |
| `Accept` | Walk the XML tree visiting this node and all of its children. | `virtual bool Accept( TiXmlVisitor* content ) const` |
| `CopyTo` |  | `void CopyTo( TiXmlText* target ) const` |
| `Blank` |  | `bool Blank() const;    // returns true if all white space and new lines` |
| `StreamIn` |  | `virtual void StreamIn( std::istream * in, TIXML_STRING * tag )` |

### Klasa: `TiXmlDeclaration`

In correct XML the declaration is the first entry in the file. @verbatim <?xml version="1.0" standalone="yes"?> @endverbatim  TinyXml will happily read or write files without a declaration, however. There are 3 possible attributes to the declaration: version, encoding, and standalone.  Note: In this version of the code, the attributes are handled as special cases, not generic attributes, simply because there can only be at most 3 and they are always the same.

| Member | Brief | Signature |
|--------|-------|-----------|
| `Print` |  | `virtual void Print( FILE* cfile, int depth, TIXML_STRING* str ) const` |
| `Print` |  | `virtual void Print( FILE* cfile, int depth ) const {` |
| `Accept` | Walk the XML tree visiting this node and all of its children. | `virtual bool Accept( TiXmlVisitor* visitor ) const` |
| `CopyTo` |  | `void CopyTo( TiXmlDeclaration* target ) const` |
| `StreamIn` |  | `virtual void StreamIn( std::istream * in, TIXML_STRING * tag )` |

### Klasa: `TiXmlUnknown`

Any tag that tinyXml doesn't recognize is saved as an unknown. It is a tag of text, but should not be modified. It will be written back to the XML, unchanged, when the file is saved.  DTD tags get thrown into TiXmlUnknowns.

| Member | Brief | Signature |
|--------|-------|-----------|
| `Print` |  | `virtual void Print( FILE* cfile, int depth ) const` |
| `Accept` | Walk the XML tree visiting this node and all of its children. | `virtual bool Accept( TiXmlVisitor* content ) const` |
| `CopyTo` |  | `void CopyTo( TiXmlUnknown* target ) const` |
| `StreamIn` |  | `virtual void StreamIn( std::istream * in, TIXML_STRING * tag )` |

### Klasa: `TiXmlDocument`

Always the top level node. A document binds together all the XML pieces. It can be saved, loaded, and printed to the screen. The 'value' of a document node is the xml file name.

| Member | Brief | Signature |
|--------|-------|-----------|
| `LoadFile` | Load a file using the current document value. Returns true if successful. Will delete any existing d | `bool LoadFile( TiXmlEncoding encoding = TIXML_DEFAULT_ENCODING )` |
| `SaveFile` | Save a file using the current document value. Returns true if successful. | `bool SaveFile() const` |
| `LoadFile` | Load a file using the given filename. Returns true if successful. | `bool LoadFile( const char * filename, TiXmlEncoding encoding = TIXML_DEFAULT_ENCODING )` |
| `SaveFile` | Save a file using the given filename. Returns true if successful. | `bool SaveFile( const char * filename ) const` |
| `LoadFile` | Load a file using the given FILE*. Returns true if successful. Note that this method doesn't stream  | `bool LoadFile( FILE*, TiXmlEncoding encoding = TIXML_DEFAULT_ENCODING )` |
| `SaveFile` | Save a file using the given FILE*. Returns true if successful. | `bool SaveFile( FILE* ) const` |
| `LoadFile` |  | `bool LoadFile( const std::string& filename, TiXmlEncoding encoding = TIXML_DEFAULT_ENCODING )            ///< STL std::string version.` |
| `LoadFile` |  | `return LoadFile( filename.c_str(), encoding )` |
| `SaveFile` |  | `bool SaveFile( const std::string& filename ) const        ///< STL std::string version.` |
| `SaveFile` |  | `return SaveFile( filename.c_str() )` |
| `Error` | If an error occurs, Error will be set to true. Also, - The ErrorId() will contain the integer identi | `bool Error() const                        { return error; }` |
| `ErrorId` | Generally, you probably want the error string ( ErrorDesc() ). But if you prefer the ErrorId, this f | `int ErrorId()    const                { return errorId; }` |
| `ErrorRow` | Returns the location (if known) of the error. The first column is column 1, and the first row is row | `int ErrorRow() const    { return errorLocation.row+1; }` |
| `ErrorCol` |  | `int ErrorCol() const    { return errorLocation.col+1; }    ///< The column where the error occured. See ErrorRow()` |
| `doc` |  | `TiXmlDocument doc` |
| `SetTabSize` | SetTabSize() allows the error reporting functions (ErrorRow() and ErrorCol()) to report the correct  | `void SetTabSize( int _tabsize )        { tabsize = _tabsize; }` |
| `TabSize` |  | `int TabSize() const    { return tabsize; }` |
| `ClearError` | If you have handled the error, it can be reset with this call. The error state is automatically clea | `void ClearError()                        {    error = false` |
| `Print` | Write the document to standard out using formatted printing ("pretty print"). | `void Print() const                        { Print( stdout, 0 ); }` |
| `Print` | Write the document to a string using formatted printing ("pretty print"). This will allocate a chara | `virtual void Print( FILE* cfile, int depth = 0 ) const` |
| `SetError` |  | `void SetError( int err, const char* errorLocation, TiXmlParsingData* prevData, TiXmlEncoding encoding )` |
| `Accept` | Walk the XML tree visiting this node and all of its children. | `virtual bool Accept( TiXmlVisitor* content ) const` |
| `StreamIn` |  | `virtual void StreamIn( std::istream * in, TIXML_STRING * tag )` |

### Klasa: `TiXmlHandle`

A TiXmlHandle is a class that wraps a node pointer with null checks; this is an incredibly useful thing. Note that TiXmlHandle is not part of the TinyXml DOM structure. It is a separate utility class.  Take an example: @verbatim <Document> <Element attributeA = "valueA"> <Child attributeB = "value1" /> <Child attributeB = "value2" /> </Element> <Document> @endverbatim  Assuming you want the value of "attributeB" in the 2nd "Child" element, it's very easy to write a *lot* of code that looks like:  @verbatim TiXmlElement* root = document.FirstChildElement( "Document" ); if ( root ) { TiXmlElement* element = root->FirstChildElement( "Element" ); if ( element ) { TiXmlElement* child = element->FirstChildElement( "Child" ); if ( child ) { TiXmlElement* child2 = child->NextSiblingElement( "Child" ); if ( child2 ) { // Finally do something useful. @endverbatim  And that doesn't even cover "else" cases. TiXmlHandle addresses the verbosity of such code. A TiXmlHandle checks for null    pointers so it is perfectly safe and correct to use:  @verbatim TiXmlHandle docHandle( &document ); TiXmlElement* child2 = docHandle.FirstChild( "Document" ).FirstChild( "Element" ).Child( "Child", 1 ).ToElement(); if ( child2 ) { // do something useful @endverbatim  Which is MUCH more concise and useful.  It is also safe to copy handles - internally they are nothing more than node pointers. @verbatim TiXmlHandle handleCopy = handle; @endverbatim  What they should not be used for is iteration:  @verbatim int i=0; while ( true ) { TiXmlElement* child = docHandle.FirstChild( "Document" ).FirstChild( "Element" ).Child( "Child", i ).ToElement(); if ( !child ) break; // do something ++i; } @endverbatim  It seems reasonable, but it is in fact two embedded while loops. The Child method is a linear walk to find the element, so this code would iterate much more than it needs to. Instead, prefer:  @verbatim TiXmlElement* child = docHandle.FirstChild( "Document" ).FirstChild( "Element" ).FirstChild( "Child" ).ToElement();  for( child; child; child=child->NextSiblingElement() ) { // do something } @endverbatim

| Member | Brief | Signature |
|--------|-------|-----------|
| `operator` |  | `TiXmlHandle operator=( const TiXmlHandle& ref ) { if ( &ref != this ) this->node = ref.node; return *this; }` |
| `FirstChild` | Return a handle to the first child node. | `TiXmlHandle FirstChild() const` |
| `FirstChild` | Return a handle to the first child node with the given name. | `TiXmlHandle FirstChild( const char * value ) const` |
| `FirstChildElement` | Return a handle to the first child element. | `TiXmlHandle FirstChildElement() const` |
| `FirstChildElement` | Return a handle to the first child element with the given name. | `TiXmlHandle FirstChildElement( const char * value ) const` |
| `Child` | Return a handle to the "index" child with the given name. The first child is 0, the second 1, etc. | `TiXmlHandle Child( const char* value, int index ) const` |
| `Child` | Return a handle to the "index" child. The first child is 0, the second 1, etc. | `TiXmlHandle Child( int index ) const` |
| `ChildElement` | Return a handle to the "index" child element with the given name. The first child element is 0, the  | `TiXmlHandle ChildElement( const char* value, int index ) const` |
| `ChildElement` | Return a handle to the "index" child element. The first child element is 0, the second 1, etc. Note  | `TiXmlHandle ChildElement( int index ) const` |
| `FirstChild` |  | `TiXmlHandle FirstChild( const std::string& _value ) const                { return FirstChild( _value.c_str() ); }` |
| `FirstChildElement` |  | `TiXmlHandle FirstChildElement( const std::string& _value ) const        { return FirstChildElement( _value.c_str() ); }` |
| `Child` |  | `TiXmlHandle Child( const std::string& _value, int index ) const            { return Child( _value.c_str(), index ); }` |
| `ChildElement` |  | `TiXmlHandle ChildElement( const std::string& _value, int index ) const    { return ChildElement( _value.c_str(), index ); }` |

### Klasa: `TiXmlPrinter`

Print to memory functionality. The TiXmlPrinter is useful when you need to:  -# Print to memory (especially in non-STL mode) -# Control formatting (line endings, etc.)  When constructed, the TiXmlPrinter is in its default "pretty printing" mode. Before calling Accept() you can call methods to control the printing of the XML document. After TiXmlNode::Accept() is called, the printed document can be accessed via the CStr(), Str(), and Size() methods.  TiXmlPrinter uses the Visitor API. @verbatim TiXmlPrinter printer; printer.SetIndent( "\t" );  doc.Accept( &printer ); fprintf( stdout, "%s", printer.CStr() ); @endverbatim

| Member | Brief | Signature |
|--------|-------|-----------|
| `VisitEnter` |  | `virtual bool VisitEnter( const TiXmlDocument& doc )` |
| `VisitExit` |  | `virtual bool VisitExit( const TiXmlDocument& doc )` |
| `VisitEnter` |  | `virtual bool VisitEnter( const TiXmlElement& element, const TiXmlAttribute* firstAttribute )` |
| `VisitExit` |  | `virtual bool VisitExit( const TiXmlElement& element )` |
| `Visit` |  | `virtual bool Visit( const TiXmlDeclaration& declaration )` |
| `Visit` |  | `virtual bool Visit( const TiXmlText& text )` |
| `Visit` |  | `virtual bool Visit( const TiXmlComment& comment )` |
| `Visit` |  | `virtual bool Visit( const TiXmlUnknown& unknown )` |
| `tab` |  | `but tab (\t) is also useful, or null/empty string for no indentation.` |
| `SetIndent` | Set the indent characters for printing. By default 4 spaces but tab (\t) is also useful, or null/emp | `void SetIndent( const char* _indent )            { indent = _indent ? _indent : "" ; }` |
| `SetLineBreak` | Set the line breaking string. By default set to newline (\n). Some operating systems prefer other ch | `void SetLineBreak( const char* _lineBreak )        { lineBreak = _lineBreak ? _lineBreak : ""; }` |
| `SetStreamPrinting` | Switch over to "stream printing" which is the most dense formatting without linebreaks. Common when  | `void SetStreamPrinting()                        { indent = ""` |
| `Size` | Return the length of the result string. | `size_t Size()                                    { return buffer.size(); }` |

## Enums

### `TiXmlEncoding`

**Wartości:**

- `TIXML_ENCODING_UNKNOWN`
- `TIXML_ENCODING_UTF8`
- `TIXML_ENCODING_LEGACY`

### `NodeType`

The types of XML nodes supported by TinyXml. (All the unsupported types are picked up by UNKNOWN.)

**Wartości:**

- `TINYXML_DOCUMENT`
- `TINYXML_ELEMENT`
- `TINYXML_COMMENT`
- `TINYXML_UNKNOWN`
- `TINYXML_TEXT`
- `TINYXML_DECLARATION`
- `TINYXML_TYPECOUNT`

## Functions

### `Clear`

**Sygnatura:** `void Clear()        { row = col = -1; }`

### `Accept`

**Sygnatura:** `Generally Accept() is called on the TiXmlDocument, although all nodes suppert Visiting.`

### `SetCondenseWhiteSpace`

The world does not agree on whether white space should be kept or not. In order to make everyone happy, these global, static functions are provided to set whether or not TinyXml will condense all white space into a single space or not. The default is to condense. Note changing this value is not thread safe.

**Sygnatura:** `static void SetCondenseWhiteSpace( bool condense )        { condenseWhiteSpace = condense; }`

### `IsWhiteSpaceCondensed`

Return the current white space setting.

**Sygnatura:** `static bool IsWhiteSpaceCondensed()                        { return condenseWhiteSpace; }`

### `Row`

Return the position, in the original source file, of this node or attribute. The row and column are 1-based. (That is the first row and first column is 1,1). If the returns values are 0 or less, then the parser does not have a row and column value.  Generally, the row and column value will be set when the TiXmlDocument::Load(), TiXmlDocument::LoadFile(), or any TiXmlNode::Parse() is called. It will NOT be set when the DOM was created from operator>>.  The values reflect the initial load. Once the DOM is modified programmatically (by adding or changing nodes and attributes) the new values will NOT update to reflect changes in the document.  There is a minor performance cost to computing the row and column. Computation can be disabled if TiXmlDocument::SetTabSize() is called with 0 as the value.  @sa TiXmlDocument::SetTabSize()

**Sygnatura:** `int Row() const            { return location.row + 1; }`

### `Column`

**Sygnatura:** `int Column() const        { return location.col + 1; }    ///< See Row()`

### `SetUserData`

**Sygnatura:** `void  SetUserData( void* user )            { userData = user; }    ///< Set a pointer to arbitrary user data.`

### `EncodeString`

Expands entities in a string. Note this should not contian the tag's '<', '>', etc, or they will be transformed into entities!

**Sygnatura:** `static void EncodeString( const TIXML_STRING& str, TIXML_STRING* out )`

### `IsWhiteSpace`

**Sygnatura:** `inline static bool IsWhiteSpace( char c )`

### `IsWhiteSpace`

**Sygnatura:** `inline static bool IsWhiteSpace( int c )`

### `IsWhiteSpace`

**Sygnatura:** `return IsWhiteSpace( (char) c )`

### `StreamWhiteSpace`

**Sygnatura:** `static bool    StreamWhiteSpace( std::istream * in, TIXML_STRING * tag )`

### `StreamTo`

**Sygnatura:** `static bool StreamTo( std::istream * in, int character, TIXML_STRING * tag )`

### `GetEntity`

**Sygnatura:** `return GetEntity( p, _value, length, encoding )`

### `if`

**Sygnatura:** `else if ( *length )`

### `IsAlpha`

**Sygnatura:** `static int IsAlpha( unsigned char anyByte, TiXmlEncoding encoding )`

### `IsAlphaNum`

**Sygnatura:** `static int IsAlphaNum( unsigned char anyByte, TiXmlEncoding encoding )`

### `ToLower`

**Sygnatura:** `inline static int ToLower( int v, TiXmlEncoding encoding )`

### `tolower`

**Sygnatura:** `return tolower( v )`

### `ConvertUTF32ToUTF8`

**Sygnatura:** `static void ConvertUTF32ToUTF8( unsigned long input, char* output, int* length )`

### `TiXmlElement`

**Sygnatura:** `a TiXmlElement (for example) and read that from an input stream,`

### `SetValue`

Changes the value of the node. Defined as: @verbatim Document:    filename of the xml file Element:    name of the element Comment:    the comment text Unknown:    the tag contents Text:        the text string @endverbatim

**Sygnatura:** `void SetValue(const char * _value) { value = _value;}`

### `SetValue`

STL std::string form.

**Sygnatura:** `void SetValue( const std::string& _value )    { value = _value; }`

### `Clear`

Delete all the children of this node. Does not affect 'this'.

**Sygnatura:** `void Clear()`

### `owned`

**Sygnatura:** `henceforth owned (and deleted) by tinyXml. This method is efficient`

### `RemoveChild`

Delete a child of this node.

**Sygnatura:** `bool RemoveChild( TiXmlNode* removeThis )`

### `Type`

Query the type (as an enumerated value, above) of this node. The possible types are: TINYXML_DOCUMENT, TINYXML_ELEMENT, TINYXML_COMMENT, TINYXML_UNKNOWN, TINYXML_TEXT, and TINYXML_DECLARATION.

**Sygnatura:** `int Type() const    { return type; }`

### `NoChildren`

Returns true if this node has no children.

**Sygnatura:** `bool NoChildren() const                        { return !firstChild; }`

### `CopyTo`

**Sygnatura:** `void CopyTo( TiXmlNode* target ) const`

### `IntValue`

**Sygnatura:** `int                IntValue() const;                                    ///< Return the value of this attribute, converted to an integer.`

### `DoubleValue`

**Sygnatura:** `double            DoubleValue() const;                                ///< Return the value of this attribute, converted to a double.`

### `QueryIntValue`

QueryIntValue examines the value string. It is an alternative to the IntValue() method with richer error checking. If the value is an integer, it is stored in 'value' and the call returns TIXML_SUCCESS. If it is not an integer, it returns TIXML_WRONG_TYPE.  A specialized but useful call. Note that for success it returns 0, which is the opposite of almost all other TinyXml calls.

**Sygnatura:** `int QueryIntValue( int* _value ) const`

### `QueryDoubleValue`

QueryDoubleValue examines the value string. See QueryIntValue().

**Sygnatura:** `int QueryDoubleValue( double* _value ) const`

### `SetName`

**Sygnatura:** `void SetName( const char* _name )    { name = _name; }                ///< Set the name of this attribute.`

### `SetValue`

**Sygnatura:** `void SetValue( const char* _value )    { value = _value; }                ///< Set the value.`

### `SetIntValue`

**Sygnatura:** `void SetIntValue( int _value );                                        ///< Set the value from an integer.`

### `SetDoubleValue`

**Sygnatura:** `void SetDoubleValue( double _value );                                ///< Set the value from a double.`

### `SetName`

STL std::string form.

**Sygnatura:** `void SetName( const std::string& _name )    { name = _name; }`

### `SetValue`

STL std::string form.

**Sygnatura:** `void SetValue( const std::string& _value )    { value = _value; }`

### `Print`

**Sygnatura:** `void Print( FILE* cfile, int depth, TIXML_STRING* str ) const`

### `SetDocument`

**Sygnatura:** `void SetDocument( TiXmlDocument* doc )    { document = doc; }`

### `Add`

**Sygnatura:** `void Add( TiXmlAttribute* attribute )`

### `Remove`

**Sygnatura:** `void Remove( TiXmlAttribute* attribute )`

### `readType`

**Sygnatura:** `inline T readType(const std::string& str) const`

### `T`

**Sygnatura:** `return T()`

### `sstream`

**Sygnatura:** `std::stringstream sstream( node->ValueStr() )`

### `QueryValueAttribute`

**Sygnatura:** `int QueryValueAttribute( const std::string& name, std::string* outValue ) const`

### `Attribute`

**Sygnatura:** `std::string Attribute( const std::string& name ) const`

### `Attribute`

**Sygnatura:** `std::string Attribute( const std::string& name, int* i ) const`

### `Attribute`

**Sygnatura:** `std::string Attribute( const std::string& name, double* d ) const`

### `SetAttribute`

**Sygnatura:** `void SetAttribute( const std::string& name, const std::string& _value )`

### `SetAttribute`

**Sygnatura:** `void SetAttribute( const std::string& name, int _value) { SetAttribute(name, stdext::to_string(_value)); }`

### `RemoveAttribute`

**Sygnatura:** `void RemoveAttribute( const std::string& name )`

### `GetText`

**Sygnatura:** `WARNING: GetText() accesses a child node - don't become confused with the`

### `CopyTo`

**Sygnatura:** `void CopyTo( TiXmlElement* target ) const`

### `ClearThis`

**Sygnatura:** `void ClearThis();    // like clear, but initializes 'this' object as well`

### `CopyTo`

**Sygnatura:** `void CopyTo( TiXmlComment* target ) const`

### `CDATA`

Queries whether this represents text using a CDATA section.

**Sygnatura:** `bool CDATA() const                { return cdata; }`

### `SetCDATA`

Turns on or off a CDATA representation of text.

**Sygnatura:** `void SetCDATA( bool _cdata )    { cdata = _cdata; }`

### `CopyTo`

**Sygnatura:** `void CopyTo( TiXmlText* target ) const`

### `Blank`

**Sygnatura:** `bool Blank() const;    // returns true if all white space and new lines`

### `CopyTo`

**Sygnatura:** `void CopyTo( TiXmlDeclaration* target ) const`

### `CopyTo`

**Sygnatura:** `void CopyTo( TiXmlUnknown* target ) const`

### `LoadFile`

Load a file using the current document value. Returns true if successful. Will delete any existing document data before loading.

**Sygnatura:** `bool LoadFile( TiXmlEncoding encoding = TIXML_DEFAULT_ENCODING )`

### `SaveFile`

Save a file using the current document value. Returns true if successful.

**Sygnatura:** `bool SaveFile() const`

### `LoadFile`

Load a file using the given filename. Returns true if successful.

**Sygnatura:** `bool LoadFile( const char * filename, TiXmlEncoding encoding = TIXML_DEFAULT_ENCODING )`

### `SaveFile`

Save a file using the given filename. Returns true if successful.

**Sygnatura:** `bool SaveFile( const char * filename ) const`

### `LoadFile`

Load a file using the given FILE*. Returns true if successful. Note that this method doesn't stream - the entire object pointed at by the FILE* will be interpreted as an XML file. TinyXML doesn't stream in XML from the current file location. Streaming may be added in the future.

**Sygnatura:** `bool LoadFile( FILE*, TiXmlEncoding encoding = TIXML_DEFAULT_ENCODING )`

### `SaveFile`

Save a file using the given FILE*. Returns true if successful.

**Sygnatura:** `bool SaveFile( FILE* ) const`

### `LoadFile`

**Sygnatura:** `bool LoadFile( const std::string& filename, TiXmlEncoding encoding = TIXML_DEFAULT_ENCODING )            ///< STL std::string version.`

### `LoadFile`

**Sygnatura:** `return LoadFile( filename.c_str(), encoding )`

### `SaveFile`

**Sygnatura:** `bool SaveFile( const std::string& filename ) const        ///< STL std::string version.`

### `SaveFile`

**Sygnatura:** `return SaveFile( filename.c_str() )`

### `Error`

If an error occurs, Error will be set to true. Also, - The ErrorId() will contain the integer identifier of the error (not generally useful) - The ErrorDesc() method will return the name of the error. (very useful) - The ErrorRow() and ErrorCol() will return the location of the error (if known)

**Sygnatura:** `bool Error() const                        { return error; }`

### `ErrorId`

Generally, you probably want the error string ( ErrorDesc() ). But if you prefer the ErrorId, this function will fetch it.

**Sygnatura:** `int ErrorId()    const                { return errorId; }`

### `ErrorRow`

Returns the location (if known) of the error. The first column is column 1, and the first row is row 1. A value of 0 means the row and column wasn't applicable (memory errors, for example, have no row/column) or the parser lost the error. (An error in the error reporting, in that case.)  @sa SetTabSize, Row, Column

**Sygnatura:** `int ErrorRow() const    { return errorLocation.row+1; }`

### `ErrorCol`

**Sygnatura:** `int ErrorCol() const    { return errorLocation.col+1; }    ///< The column where the error occured. See ErrorRow()`

### `SetTabSize`

SetTabSize() allows the error reporting functions (ErrorRow() and ErrorCol()) to report the correct values for row and column. It does not change the output or input in any way.  By calling this method, with a tab size greater than 0, the row and column of each node and attribute is stored when the file is loaded. Very useful for tracking the DOM back in to the source file.  The tab size is required for calculating the location of nodes. If not set, the default of 4 is used. The tabsize is set per document. Setting the tabsize to 0 disables row/column tracking.  Note that row and column tracking is not supported when using operator>>.  The tab size needs to be enabled before the parse or load. Correct usage: @verbatim TiXmlDocument doc; doc.SetTabSize( 8 ); doc.Load( "myfile.xml" ); @endverbatim  @sa Row, Column

**Sygnatura:** `void SetTabSize( int _tabsize )        { tabsize = _tabsize; }`

### `TabSize`

**Sygnatura:** `int TabSize() const    { return tabsize; }`

### `ClearError`

If you have handled the error, it can be reset with this call. The error state is automatically cleared if you Parse a new XML block.

**Sygnatura:** `void ClearError()                        {    error = false`

### `Print`

Write the document to standard out using formatted printing ("pretty print").

**Sygnatura:** `void Print() const                        { Print( stdout, 0 ); }`

### `SetError`

**Sygnatura:** `void SetError( int err, const char* errorLocation, TiXmlParsingData* prevData, TiXmlEncoding encoding )`

### `CopyTo`

**Sygnatura:** `void CopyTo( TiXmlDocument* target ) const`

### `docHandle`

**Sygnatura:** `TiXmlHandle docHandle( &document )`

### `FirstChild`

Return a handle to the first child node.

**Sygnatura:** `TiXmlHandle FirstChild() const`

### `FirstChild`

Return a handle to the first child node with the given name.

**Sygnatura:** `TiXmlHandle FirstChild( const char * value ) const`

### `FirstChildElement`

Return a handle to the first child element.

**Sygnatura:** `TiXmlHandle FirstChildElement() const`

### `FirstChildElement`

Return a handle to the first child element with the given name.

**Sygnatura:** `TiXmlHandle FirstChildElement( const char * value ) const`

### `Child`

Return a handle to the "index" child with the given name. The first child is 0, the second 1, etc.

**Sygnatura:** `TiXmlHandle Child( const char* value, int index ) const`

### `Child`

Return a handle to the "index" child. The first child is 0, the second 1, etc.

**Sygnatura:** `TiXmlHandle Child( int index ) const`

### `ChildElement`

Return a handle to the "index" child element with the given name. The first child element is 0, the second 1, etc. Note that only TiXmlElements are indexed: other types are not counted.

**Sygnatura:** `TiXmlHandle ChildElement( const char* value, int index ) const`

### `ChildElement`

Return a handle to the "index" child element. The first child element is 0, the second 1, etc. Note that only TiXmlElements are indexed: other types are not counted.

**Sygnatura:** `TiXmlHandle ChildElement( int index ) const`

### `FirstChild`

**Sygnatura:** `TiXmlHandle FirstChild( const std::string& _value ) const                { return FirstChild( _value.c_str() ); }`

### `FirstChildElement`

**Sygnatura:** `TiXmlHandle FirstChildElement( const std::string& _value ) const        { return FirstChildElement( _value.c_str() ); }`

### `Child`

**Sygnatura:** `TiXmlHandle Child( const std::string& _value, int index ) const            { return Child( _value.c_str(), index ); }`

### `ChildElement`

**Sygnatura:** `TiXmlHandle ChildElement( const std::string& _value, int index ) const    { return ChildElement( _value.c_str(), index ); }`

### `tab`

**Sygnatura:** `but tab (\t) is also useful, or null/empty string for no indentation.`

### `SetIndent`

Set the indent characters for printing. By default 4 spaces but tab (\t) is also useful, or null/empty string for no indentation.

**Sygnatura:** `void SetIndent( const char* _indent )            { indent = _indent ? _indent : "" ; }`

### `SetLineBreak`

Set the line breaking string. By default set to newline (\n). Some operating systems prefer other characters, or can be set to the null/empty string for no indenation.

**Sygnatura:** `void SetLineBreak( const char* _lineBreak )        { lineBreak = _lineBreak ? _lineBreak : ""; }`

### `SetStreamPrinting`

Switch over to "stream printing" which is the most dense formatting without linebreaks. Common when the XML is needed for network transmission.

**Sygnatura:** `void SetStreamPrinting()                        { indent = ""`

### `Size`

Return the length of the result string.

**Sygnatura:** `size_t Size()                                    { return buffer.size(); }`

### `DoIndent`

**Sygnatura:** `void DoIndent()    {`

### `DoLineBreak`

**Sygnatura:** `void DoLineBreak() {`

## Class Diagram

Zobacz: [../diagrams/tinyxml.mmd](../diagrams/tinyxml.mmd)

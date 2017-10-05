# Cm grammar

## comments

```ebnf
multilineComment ::= '/*' multilineComment '*/'
                  | '/\*[\W\w]*?/\*'

Comment := "//" R'[^\n]*'
```

## basics

```ebnf
numberLiteral := R'(0[XxOoBb])?[\da-fA-F]+'

Constant := "null"
          |  "true"
          |  "false"

BuiltInType := "i8"
             |  "i16"
             |  "i32"
             |  "i64"
             |  "u8"
             |  "u16"
             |  "u32"
             |  "u64"
             |  "f32"
             |  "f64"
             |  "void"
             |  "bool"
             |  "nulltype"
             |  "string"

EOL ::= ";"

simpleName ::= <Java Identifier>
            | "`" <Java Identifier> "`"

labelName ::= ":" <simpleName>

block := "{" <statement>* "}"

body := <block> | <statement>
```

## module related

```ebnf
module := <simpleName> { "." }

moduleDeclaration := "module" <module> <EOL>

import := "import" <module> <EOL>
```


## statement

```ebnf
if := "if" "(" <expression> ")" <body>
   [ "else" <body> ]

statement := <expression> <EOL>
          | ??

while := "while" "(" <expression> ")" <body>

loop := "loop" <body>
```

## declaration

```ebnf
structDeclaration := "struct" <simpleName> "{"
                  ( <variableDeclarationEntry> <EOL> )*
                  "}"

variableDeclarationEntry := <simpleName>
                         [ ":" <type> ]

variableDeclaration := ( "let" | "var" )
                    <variableDeclarationEntry>
                    [ "=" <expression> ] <EOL>
```

## type

```ebnf
type := <simpleName> | <lambdaType>

lambdaType := <type> "(" <type> { "," } ")"

genericType := <type> <genericArguments>
```

## expression

```ebnf
expression := ??

parameters := "(" <expression> { "," } ")"
           [ <functionLiteral> ]

genericParameters := "<" <simpleName> { "," } ">"

genericArguments := "<" <type> { "," } ">"

methodCall := <expression> "." <simpleName> <parameters>

functionCall := <expression> <parameters>

invocation := <functionCall> | <methodCall>

functionLiteral := <block>
                | [ <type> ] [ <genericParameters> ] "{" <variableDeclarationEntry> { "," } "->" statement* "}"
                | <variableDeclarationEntry> "->" <expression>
                | "(" <variableDeclarationEntry> { "," } ")" "->" <expression>

forComprehension := "for" "{"
                 ( <simpleName> "<-" <expression> ) { <EOL> }
                 "}" "yield" <expression>
```

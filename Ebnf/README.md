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
          |  "nan"
          |  "inf"

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

## statement

```ebnf
if := "if" "(" <expression> ")" 
   [ "else" <body> ]

statement := <expression> <EOL>
          | ??

while := "while" "(" <expression> ")" <body>

loop := "loop" <block>
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
type := ??
```

## expression

```ebnf
expression := ??

functionLiteral := <block>
                | "{" <variableDeclarationEntry> { "," } "->" statement* "}"

forComprehension := "for" "{"
                 (<simpleName> "<-" <expression>) { <EOL> }
                 "}" "yield" <expression>
```

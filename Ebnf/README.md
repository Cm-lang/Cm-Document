# Cm grammar

## comments

```ebnf
multilineComment ::= '/*' multilineComment '*/'
                  | '/\*[\W\w]*?/\*'
comments ::= "//" R'[^\n]*'
```

## basics

```ebnf
Constants := "null"
          |  "true"
          |  "false"
          |  "nan"
          |  "inf"

BuiltInTypes := "i8"
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

JavaIdentifier := xxx ; TODO 帮我写一下

simpleName ::= JavaIdentifier
            | "`" <JavaIdentifier> "`"

labelName ::= ":" <simpleName>

block := "{" statement* "}"
```

## statement

```ebnf
statement := <expression> <EOL>
          | ??

while := "while" "(" <expression> ")" <block>

loop := "loop" <block>
```

## declaration

```ebnf
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

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
```

## statement

## declaration

```ebnf
variableDeclaration := ( "let" | "var" ) <simpleName>
                       [ ":" <type> ]
                       [ "=" <expression> ] EOL
```

## expression

```ebnf
expression := ??
```

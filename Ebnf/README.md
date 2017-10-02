# Cm

# comments

```ebnf
multilineComment ::= '/*' multilineComment '*/'
                  | '/\*[\W\w]*?/\*'
comments ::= "//" R'[^\n]*'
```

# terminal symbols

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
```


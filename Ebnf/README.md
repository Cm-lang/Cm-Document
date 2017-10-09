# Cm grammar

## comments

```ebnf

Any     := K'^((?!/\*|\*/|\n)[\s\S])*$'

multilineComment
        ::= '/*' (Any | NEWLINE | multilineComment)* '*/'

Comment := R'//[^\n]*'
```

## basics

```ebnf
String  := R'[a-z]*"[\w|\W]*"'

numberLiteral 
        := R'0[XxOoBb][\da-fA-F]+'

Decimal := R'\d+(?:\.\d+|)(?:E\-{0,1}\d+|)'

Constant:= K'null|false|true'

NEWLINE := R'\n'

EOL     := R';'

I       ::=  NEWLINE | Comment | multilineComment

simpleName
        := R'[a-zA-Z_][a-z0-9A-Z_]*'

Identifier
        ::= simpleName | '`' simpleName '`'

labelDeclaration
        ::= ':' Identifier

block   ::= '{' statements '}'

body    ::=  block  | statement
```

## module related

```ebnf
module  ::= simpleName (',' simpleName)*

moduleDeclaration
        ::= 'module' module

Import  ::= 'import' module
```

## statement

```ebnf
statements Throw I
        ::= (I* statement* I*)*

statement
        ::= ( flowControl  |
              declaration  |
              flowControlSign [Identifier] |
              expression
            ) [EOL]

flowControlSign
        := K'break|return|continue'

flowControl
        ::= If | While

If      ::= K'if' '(' expression ')'
                body
            [
            K'else'
                body
            ]

While   ::=  [labelDeclaration]
             K'while' '(' expression  ')'
                body
```

## declaration

```ebnf

declaration
        ::= structDeclaration | moduleDeclaration | Import | variableDeclaration

structDeclaration Throw I
        ::= K'struct' Identifier '{'
                (I* variableDeclarationEntry [','] I*)*
            '}'

variableDeclarationEntry
        ::= Identifier [':' Type]

variableDeclarationEntryList Throw I
        ::= I* variableDeclarationEntry
                (I* ','
                 I* variableDeclarationEntry)*
                 I*

variableDeclaration Throw I
        ::= (K'let' | K'var') variableDeclarationEntry [ '=' I* expression ]

genericParameters
        ::= K'<' Identifier (',' Identifier)* K'>'

```

## type

```ebnf
Type    ::=  '[' [TypeList] '=>' Type ']' | Identifier

TypeList
        ::= Type (',' Type)*

genericParameters
        ::= K'<' Identifier (',' Identifier)* K'>'
```

## expression

```ebnf
BinaryOperator := R'\/\/|\/|\|\||\||\>\>|\<\<|\>\=|\<\=|\<\-|\>|\<|\=\>|\-\-|\+\+|\*\*|\+|\-|\*|\=\=|\=|\%|\^'

UnaryOperator  := R'\?|\!|\&|\$|\@|\+|\-|\~'

expression
        ::= LambdaDef | BinaryOperation

LambdaDef Throw I
        ::= variableDeclarationEntry '->' body
            |
            '(' variableDeclarationEntryList ')' [':' Type | '=>' Type ] '->' body
            |
            '{' [variableDeclarationEntryList [':' Type | '=>' Type] '->']
                statements              # 若没有定义形式参数, 则类似kotlin的`it`或者scala的`_`
            '}' [':' Type]
            | [genericParameters] LambdaDef

BinaryOperation
        ::= UnaryOperation (BinaryOperator UnaryOperation)*

UnaryOperation
        ::= AtomExpr | UnaryOperator UnaryOperation

AtomExpr::= Atom Trailer*

expressionList Throw I
        ::= I* expression
                (I* ','
                 I* expression)*
                 I*

Trailer ::=  Call | Access

Call Throw I
        ::= '(' [expressionList] ')' I*
            [LambdaDef]

Access Throw I
        ::= I* '.' Identifier

Atom    ::= Constant | String | Identifier | numberLiteral | Decimal | '(' expression ')'
```

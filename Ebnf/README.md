# Cm grammar

## comments

```ebnf
multilineComment  
        ::= '/*' multilineComment '*/' 
            |  
            R'/\*[\W\w]*?/\*' 

Comment:= R'//[^\n]*'
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
        

Insertable
        ::= EOL | NEWLINE | Comment | multilineComment
        

simpleName       
        := R'[a-zA-Z_][a-z0-9A-Z_]*'
        

Identifier
        ::= simpleName | '`' simpleName '`'
        

labelDeclaration
        ::= ':' Identifier
        

block   ::= '{' statements '}' 
        

body    ::=  block  | statement | Insertable* body Insertable*
        



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

statements Throw Insertable
        ::= (Insertable* statement* Insertable*)*
        

statement 
        ::= flowControl | declaration | flowControlSign [Identifier] | expression  
         

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
        ::= structDeclaration | variableDeclaration
        

structDeclaration Throw Insertable
        ::= K'struct' Identifier '{' 
                (Insertable* variableDeclarationEntry Insertable*)* 
            '}' 
        

variableDeclarationEntry
        ::= Identifier [':' Type]
        

variableDeclarationEntryList  
        ::= variableDeclarationEntry (',' variableDeclarationEntry)* 
        

variableDeclaration
        ::= (K'let' | K'var') variableDeclarationEntry [ '=' expression ] 
        

```

## type

```ebnf
Type    ::=  '[' TypeList '=>' Type ']' | Identifier
        

TypeList
        ::= Type (',' Type)*
        

genericParameters 
        ::= K'<' Identifier (',' Identifier)* K'>'
        
```

## expression

```ebnf
BinaryOperator ::= R'\/\/|\/|\|\||\||\>\>|\<\<|\>\=|\<\=|\<\-|\>|\<|\=\>|\-\-|\+\+|\*\*|\+|\-|\*|\=\=|\=|\%|\^'
                
UnaryOperator  := R'\?|\!|\&|\$|\@|\+|\-|\~' 
                

expression     
        ::= LambdaDef | BinaryOperation
        

LambdaDef Throw Insertable     
        ::= variableDeclarationEntry '->' body
            |
            '(' variableDeclarationEntryList ')' '->' body
            |
            '{' Insertable*
                [variableDeclarationEntryList '->']
                statements              # 若没有定义形式参数, 则类似kotlin的`it`或者scala的`_`
            '}' 
            | [genericParameters] [Type] LambdaDef
        

BinaryOperation 
        ::= UnaryOperation (BinaryOperator UnaryOperation)* 
        

UnaryOperation
        ::= AtomExpr | UnaryOperator UnaryOperation 
        

AtomExpr::= Atom Trailer*
        

expressionList 
        ::= expression (',' expression)*
        

Atom    ::= Constant | String | Identifier | numberLiteral | Decimal | '(' expression ')'
        

Trailer ::= '(' [expressionList] ')' [LambdaDef] | '.' Identifier
        
```

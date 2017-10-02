# Cm编程语言

## 结构体类型

### 定义结构体

使用以下语法定义一个结构体：
```bnf
结构体定义 ::= struct <类型名称> '{' <成员列表> '}';
成员列表 ::= <成员>;[成员列表]
成员 ::= [权限说明] [attr] <成员名称> ':' <类型> [= <默认值>] [-> <外部实现指示器>]
外部实现指示器 ::= [外部读实现的函数名][外部写实现的函数名]
权限说明 ::= ro | rw | ow
```

<!--
ow结构体成员默认在外部不可访问，若成员里声明了 rw 则可在外部读写， ro 则仅可在外部读， wo 则仅可在外部写。
如果在 struct 里声明了函数类型，则应该指定一个在 struct 定义外部的实现。
如果成员上声明了 attr ，则说明此属性为一个属性，如果它的权限为 rw ，则应该提供其读实现和其写实现，若为 ro ，
则只提供其读实现，若为 wo 则只提供其写实现。
attr 也可不提供实现，编译器会自动为它提供一个变量作为实现。
不限制读写实现的书写顺序，编译器可以自动识别它是读实现还是写实现。
如果rw成员只提供了一个实现，则应该报错，如果没有提供实现，则自动实现。
属性成员也应该指定外部实现。

如果一个结构体指定了一个外部实现，则外部实现可对结构体内任何成员（包括 ro 、 wo ）具有 rw 级别的访问权限。
外部实现可以写有 this 参数用来访问结构体，参数必须为对当前结构体类型的引用。
如果不写 this 参数，则外部实现会成为该结构体的静态实现。
-->

### 结构体字面值

使用以下语法创建一个结构体字面值：

```bnf
结构体字面值 ::= <结构体类型名称> '{' <成员初始值列表> '}';
成员初始值列表 ::= <成员初始值> ',' [成员初始值列表]
成员初始值 ::= <成员名称> '=' <初始值>
```

### 例子
```cm
struct Vertex
{
  position : Vector4<float>;
  texCoord : Vector2<float>;
  color : Vector4<float>;
}

let Transform = { Vertex* this, Matrix4<float> mat ->
    Vertex {
        position = this.position * mat,
        texCoord = this.texCoord,
        color = this.color
    }
}

let SetColor = { Vertex* this, Vector<4> col ->
    this.color = col;
}

let GetColor = { Vertex* this ->
    this.color
}
```

# Cm 编程语言

## 流程控制

### if 表达式

```bnf
<if> ::= "if" "(" <条件表达式> ")" <语句> [ "else" <语句> ]
```

例子：

```swift
var i = 0;
let x = true;
let y = false;

if (x) i++;
else if (y) i--;
else {
	i += 2;
}
```

当 if 拥有 else 且内部所有 return 语句返回类型相同时，返回类型为该类型。否则返回 `void` 类型。

例子：

```swift
let x = 1;
let y = if (x > 0) 1 else x + 5;
let z = if (x > 1) {
	x + 5 > 0
} else {
	false
}
```

### while 循环

```bnf
<while> ::= "while" "(" <条件表达式> ")" <块>
```

例子：

```c
while (true) {
	/* body */
}
```

### do while 循环

```bnf
<do while> ::= "do" <块> "while" "(" <条件表达式> ")" ";"
```

例子：

```c
do {
  puts("6");
  a = a - 1;
} while (a > 6);
```

### for comprehension

和 Scala 一样， for comprehension 语句会被翻译为 flatMap 的连续调用

### break

break 可以从当前循环跳出。

```scala
while (someBool) {
	break;
}
```

### continue

continue 可以停止当前循环并且进入下一次循环。

```scala
while (someBool) {
  continue;
}
```


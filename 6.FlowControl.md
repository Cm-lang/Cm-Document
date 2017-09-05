# Cm 编程语言

## 流程控制

### if 语句

```bnf
<if> ::= "if" "(" <条件表达式> ")" <语句> [ "else" <语句> ]
```

例子：

```swift
var i = 0;
let x = true;
let y = false;

if(x) i++;
else if(y) i--;
else {
	i += 2;
}
```

### if 表达式

当if满足以下条件时，if可作为表达式使用：

+ 拥有else
+ if和else内的两块语句同时也是表达式
+ if和else内的两块语句表达式返回值类型相同

例子：

```swift
let x = 1;
let y = if(x > 0) 1 else x + 5;
let z = if(x > 1) {
	x + 5 > 0
}
else {
	false
}
```

### while 循环

```bnf
<while> ::= "while" "(" <条件表达式> ")" <语句>
```

例子：

```cm
while(true)
{
	/* body */
}
```

### loop 循环

```bnf
loop ::=  "loop" <语句>
```

例子：

```rust
loop { /* body */ }
```

### break

break 可以从当前循环跳出。

```groovy
while (someBool) {
	break;
}
```

### continue

continue 可以停止当前循环并且进入下一次循环。

```groovy
while (someBool) {
  continue;
}
```


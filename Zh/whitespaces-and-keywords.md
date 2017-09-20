# Cm 编程语言

## 空白与注释

Cm 语言使用以下方式来进行注释：

```java
// 这是一个单行注释

/*
 这是一个
 多行注释
*/
```

Cm 语言将会无视所有的空格、缩进、回车和换行(`\s`, `\t`, `\r`, `\n`)
(字符串中的这些字符除外，他们将被保留)，这些符号在语言的编译中不会影响语义。<br/>
因此，您在学习 Cm 的过程中不需要阅读 JavaScript 那样的专门关于换行的解析规则。

除此之外， Cm 还具有以下关键词作为保留词：

## 保留词

+ 变量修饰保留词
	+ const
	+ var
	+ let

+ 类型定义保留词
	+ func
	+ struct
	+ enum

+ 类型一类保留词
	+ i8
	+ i16
	+ i32
	+ i64
	+ u8
	+ u16
	+ u32
	+ u64
	+ f32
	+ f64
	+ void
	+ bool
	+ nulltype
	+ string

+ 流程控制保留词
	+ if
	+ else
	+ match
	+ while
	+ for
	+ do
	+ until
	+ loop
	+ times
	+ recur

+ 常量保留词
	+ true
	+ false
	+ null
	+ inf
	+ nan

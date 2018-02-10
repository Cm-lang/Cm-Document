# Cm编程语言

## Traits
特性（Traits）可以对struct进行归一化处理。
特性规定了实现了该特性的struct必须拥有一些方法。

```cm
trait Disposeable
{
   Dispose : void(Disposeable& this);
}
```

则struct可以这样去实现一个Trait：

```cm
struct File : Disposeable
{
  ...
}

let Dispose = { File& this ->
  //销毁文件实例
}

```

可以为trait提供默认实现

```cm
let Dispose = { Disposeable& this ->
  panic("未实现的Disposeable");
}

```

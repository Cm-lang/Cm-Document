# requirement : EBNFParser for CPython 3.6.
parserGenerator.py Grammar ./parser.py -test True -comment True -multiline True
python testLang.py statements -o test/total "
/* var f : auto = (i:i32, inner:[i32 => i32])->{inner(i)}; */
f (1+2)  i:auto-> 1+2

let f2 : [[i32=>i32]=>i32] = {
	g ->
		2*g(10)
}
f2 {
   i:auto -> i*20
}

struct Some{
	a:i32
	f:[i32=>i32]
	g:[[i32=>i32]=>[i32=>i32]]
}

<T> (x:int):[int=>int]->x+1
<T> (x:int)=>int->x+1
f () {
}();

f()
{};
when (x<10)
{
  print 
} 
"

python testLang.py statements -o test/Comments "
/* var f : auto = (i:i32, inner:[i32 => i32])->{inner(i)}; */
"
python testLang.py statements -o test/MultilineComments "
/* 
    /* var f : auto = (i:i32, inner:[i32 => i32])->{inner(i)}; */
    /* sss */
*/
"
python testLang.py statements -o test/Decl "
let f : [i32=>i32]= (s:i32)=>i32->{s+2}
"
python testLang.py statements -o test/Lambda "
let f = s->{s+2};
{s,g->
	s+g}
{i+j}:[=>i32]
x:i32-> x+1

"

python testLang.py statements -o test/Struct "
struct Ice{
   glova1 : MTF
   glova2 : MTF
   dd : MTF, 逗号可加可不加
}; 分号可加可不加
"

python testLang.py statements -o test/TypeDef "
(x:i32, y:i8)=>i32->x+y
<T> (x:i32, y:i8):[i32,i8=>i32]->x+y 显然泛型声明在这里没啥用
<T, G> {   泛型声明同没用
	x:i32, y:i8 => i32 ->
		x+y
}
	{
	x:i32, y:i8 :[i32,i8=>i32] ->
		x+y
}
"



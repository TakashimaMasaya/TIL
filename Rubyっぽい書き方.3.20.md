- nilガード

`number || = 10`

これは　
`number += 1`
と同じ

`number += 1`->`number = number + 1`
これは誰でもわかる。それと同じ考え方

`number ||= 10`->`number = number || 10`


既に入っていたら`number = number` で
入っていなかったら `number = 10`




- ぼっち演算子 &.

`name = object.&name`

これはもしobjectがtrueならobject.nameをfalseならnilを出力するということ

- %記法

配列を簡単に書く方法

`%w("apple","banana","orabge")` で`["apple","banana","orabge"]`

`%i("apple","banana","orabge")` で`[:apple,:banana,:orabge]`

が出力される

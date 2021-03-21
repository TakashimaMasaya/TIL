今日はコントローラーのTask.newで使う`Task`ってなんだという問題を解決した
```
class TasksController < ApplicationController
  def index
  end
  def show
  end
  def new
    @task = Task.new
  end
  def edit
  end
end
```

となりnew メソッドでオブジェクトを作るときに`Task.new` としているのでClass名は`Task`になっていると思った。
だけどここのクラスはTasksControllerだしClass.メソッドなのに`self.`を使ってない。

そこでほんとにTaskがクラスなのか調べてみた
```
def new
    @task = Task.new
    byebug
  end
```
今ここにByebug仕込んでみた

```
(byebug) Task.class
Class
```

となったのでやはりTaskはクラスなんだなと思った。

なんでだ？って思ったけど結果は
`Task.new` の `Task` は `model/task.rb` の `class Task < ApplicationRecord` らしい
つまり親のクラスから継承したものだった。
self.がいらないのは
実はこれは親クラスの `ApplicationRecord` （さらに言うとその親の ActiveRecord ）さんがうまいことやってくれてるらしい

納得した。

またもう一つ
アクションを使うには毎回ルーティングが必要なはずなのにいつもやってなくてなんでだ？って思った。
結果は`resources :tasks` で全部どんなURLがとメソッド’がきたらどのコントローラーとアクションを呼ぶか指定していた。
ここで指定されていないもののみ個別でルーティングが必要とのことだった。

納得！

現場Rails２周目に入って１周目じゃ疑問にすら思わなかったなんとなくやっていたことがどんどん理論的に分かってきて楽しい。ここまま２周目を終わらせたい。

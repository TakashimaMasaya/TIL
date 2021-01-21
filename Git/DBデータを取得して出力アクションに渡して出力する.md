ページの作り方について
rails generate controller 名前　アクション

はじめにこれをすることでページとコントローラーが作られる。
アクションを設定するとHTMLファイルが生成され、アクションを呼び出すとそのHTMLが表示される。
ただアクションがあるからHTMLがあるわけではなくその逆もしかり。


このままではどのページをいつ表示するかがわからないからURLとアクションに対するHTMLファイルを対応させる→ルーター


ルーターについて
ルーターとは渡されたURLに対してどのコントローラーとその中のアクションを渡すかを決める。
Rails.application.routes.draw do
  get "コントローラー名/アクション名" => "コントローラー名#アクション名"
end

get以下はURL名で＝＞先が呼び出すメソッドとアクション名

なのでget後のURL名は変更可能



DBのRailsでの扱い方

Formからデータを取得→データを出力アクションに渡す→出力という３つのメソッドを使ってデータを扱う。

Formからデータを取得
From内のnilでデータをコントローラーに送る、それを.newでDBに格納

データを出力アクションに渡す
 def create
    task = Task.new(task_params)
    task.save!
    redirect_to tasks_url, notice: "タスク「#{task.name}」を登録しました。"
  end
   private

  def task_params
    params.require(:task).permit(:name, :description)
  end
  
  ここで情報をPrivate化する
  
 出力
 コントローラー内で.allにてDBからデータを変数で受け取る。
 その変数をHTMLで使う。
 




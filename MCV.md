# ユーザーの一覧が表示されるまで

**Form画面を作る**

登録Formを表示するには

- アクション名->New          
- メソッド-> GET        
- URL  ->admin/users/new  

を使うので`routes.rb`で`admin/users/new`にHTTPリクエスト（メソッドGET)がきた時にUserコントローラーとnewアクションを呼ぶようにする。

newアクションでは空のオブジェクトを生成する。

`new.erb`で`from_with`を使ってHTMLにFromを生成する。`form_with`は`action属性`や`name属性`,`method`を設定しているモデルによって自動で生成してくれる。

- nameにはusers[name]
- actionには新規登録の場合モデルに設定しているのは空のオブジェクトなので/userが設定される
- methodは新規登録の場合モデルに設定しているのは空のオブジェクトなのでPOSTが設定される


**ユーザーを登録する**

ユーザーを登録するには
- アクション名 ->create          
- メソッド->Post       
- URL -> admin/users  

を使うので`routes.rb`で`admin/users`にHTTPリクエスト（メソッドPost)がきた時に`Userコントローラー`と`Createアクション`を呼ぶようにする。

Postでデータが送信されたあとデータは全てParamsに入っている。
```
def user_params
    params.require(:user).permit(:name, :email, :admin, :password, :password_confirmation)
end
```

ここで取り出して

```
def create
    @user = User.new(user_params)

    if @user.save
      redirect_to admin_users_path(@user), notice:"ユーザー「#{@user.name}」を登録しました。"
    else
      render :new
    end
end
```
ここで登録する。その際モデルにある条件と照合する。

**ユーザーを一覧表示する**

ユーザーを一覧表示するには
 - アクション名-> index          
 - メソッド-> Get       
 - URL -> /users  

を使うので`routes.rb`で`/users` にHTTPリクエスト（メソッドGet)がきた時に`Userコントローラー`と`indexアクション`を呼ぶようにする。

コントローラーで`indexメソッド`に`User.all`でDBの情報をインスタンス変数に格納する。

`index.erb`内ではコントローラーで定義した変数から一つずつループで情報を取り出してHTMLに出力する。


# タスクの一覧が表示されるまで

**新規作成ページを表示する**

新規作成ページを表示するには
 - アクション名->new          
 - メソッド -> GET        
- URL ->admin/tasks/new  

を使うので`routes.rb`で`admin/tasks/new`にHTTPリクエスト（メソッドGet)がきた時に`Taskコントローラー`と`newアクション`を呼ぶようにする。

newアクションでは空のオブジェクトを生成する。

`new.html.erb`には`from_with`を使ってFromを生成する。form_withはaction属性やname属性,methodを設定しているモデルによって自動で生成してHTMLに出力してくれる。

 f.text_field :name ここでname属性を決めているのでタスク名(name)を入力する
 - nameにはtasks[name]
 - actionには新規登録の場合モデルに設定しているのは空のオブジェクトなので/taskと自動に設定される。
 - methodは新規登録の場合モデルに設定しているのは空のオブジェクトなのでPOSTが設定される

 作成ボタンを押すとPOSTがリクエストボディの中で送信される

 **タスクを登録する**

 タスクを登録するには
 - アクション名->Create          
 - メソッド-> Post       
 - URL ->admin/tasks  

を使うので`routes.rb`で`admin/tasks`にHTTPリクエスト（メソッドPost)がきた時に`Taskコントローラー`と`Createアクション`を呼ぶようにする。

Postでデータが送信されたあとデータは全てParamsに入っている。
```
 def task_params
    params.require(:task).permit(:name, :description, :image)
end
```

ここで取り出して

```
def create
    @task = Task.new(task_params.merge(user_id: current_user.id))

    if @task.save
      TaskMailer.creation_email(@task).deliver_now
      redirect_to @task, notice: "タスク「#{@task.name}」を登録しました。"
    else
      render :new
    end
  end
```

ここで登録する。その際モデルにある条件と照合する。

**タスクを一覧表示する**

タスクを一覧表示するには
 - アクション名-> index          
 - メソッド ->Get       
 - URL ->/tasks 

を使うので`routes.rb`で`/tasks`にHTTPリクエスト（メソッドGet)がきた時に`Taskコントローラー`と`indexアクション`を呼ぶようにする。

indexメソッドはこのようになっている
```
def index
    @q = current_user.tasks.ransack(params[:q])
    @tasks = @q.result(distinct: true).page(params[:page])
  end
```

`current_user`とはログインしているユーザーを示す
こうすることで`＠tasks`にはログインしている人のタスク情報が入る

index.erb内ではコントローラーで定義した変数から一つずつループで情報を取り出してHTMLに出力する。
```
 - @tasks.each do |task|
      tr
        td= link_to task.name, task
        td= task.created_at
```

**タスクの詳細画面に遷移する**

タスク名の部分を
```
link_to task.name, task
```
とすることで`aタグ`として判断される。

第二引数（ここではtask）をリンク先として指定している。

今回の場合リンクは`/tasks/17`となる

ルーターで`/tasks/17`にGetが送られてきた時`Taskコントローラー`と`showメソッド`を呼ぶ
showメソッドでは現在のユーザーのタスク情報を@taskに入れている
```
 def show
    @task = current_user.tasks.find(params[:id])
  end
```

そしてshowのerbで
```
td= @task.name
```
とすることでユーザーの名前などをHTMLに出力できる



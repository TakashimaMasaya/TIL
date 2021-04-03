今日は主にAjaxについて学んだ。

削除ボタンを押したときに非同期で削除する方法

- **DBから削除する**

1. Ajaxでサーバーにリクエストを送る
2. DBから情報が削除される
3. コントローラーからステータスコード204が返される
4. それによりajax:successイベントが発生する・

- **画面から削除する**

1. ajax:successイベントが発生したら文字に対してdisplay noneを付与する。

---

**１のやり方**

1. remote: trueをlink_toの引数として削除ボタンにかく
```
= link_to '削除', task, method: :delete, remote: true
```
2. destroyメソッドでDBから情報を削除する
3. destroyメソッドにhead :no_contentとしてステータスコード204が返されるようにする

```
def destroy
  @task.destroy
  head :no_content
end
```

**２のやり方**

```
docment.addEventLister('ajax:success', function(){
  docment.style.display = 'none';
 };
```






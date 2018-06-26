# courseR

Hi, I am Sunny.
There are my R projects in the 1062semester.

Week_1
------
* 主題：認識Ｒ基本操作
* 完成型態：個人作業
* 作業連結：[HW_1](https://github.com/Suuuuny/courseR/tree/master/week_1)<br />

Week_2
------
* 主題：網頁爬蟲
* 完成型態：個人作業
* 作業簡介：用rvest與css selector爬自由時報新聞
* 作業連結：[HW_2](https://github.com/Suuuuny/courseR/tree/master/week_2)<br />

Week_3
------
* 主題：資料視覺化練習
* 完成型態：個人作業
* 作業簡介：爬政府公開資料的獨立演唱會資料，並使用ggmap和ggplot2套件包在地圖上繪製出演唱會地點與相關資訊。
* 作業連結：[HW_3](https://github.com/Suuuuny/courseR/tree/master/week_3)<br />
  >問題：<br />
  >Mac電腦上的plot顯示不出中文店家名<br />
  >調整縣市欄位的資料， ex：台北市／臺北市統一改成Taipei 803/高雄市統一改成Kaohsiung<br />
  >用正規表達式將"Price"欄位整理成只有單人價格<br />
  >Rmd目前無法knit出html<br />

Week_4
------
* 主題：OpenApi與文字雲繪製
* 完成型態：個人作業
* 作業簡介：爬取CNN臉書粉專發文，並使用wordcloud套件包繪製文字雲。
* 作業連結：[HW_4](https://github.com/Suuuuny/courseR/tree/master/week_4)<br />
  >問題：<br />
  >1.起初是爬了環保署副署長詹順貴的粉專發文，後來繪製文字雲時，使用了<pre><code>par(family=("Heiti TC Light"))</code></pre>這行程式碼使得文字雲繪製時不產生亂碼。但後來改成在Rmd檔編輯時，文字雲卻始終是亂碼跑不出來中文。（即為作業連結裡面的hw4_zhanpost.R）<br />
  >2.因此後來選擇重新爬CNN粉專發文，發覺英文斷詞和中文斷詞是不太一樣的，不能將一些”a“”an“直觀覺得無意義的詞刪掉，因為這樣很有可能會刪去某個單字的部分字母ＱＱ但若是只有使用空白斷詞，感覺又不太夠，因此覺得仍然可以再琢磨。<br />

Week_5
------
* 主題：TF-IDF
* 完成型態：個人作業
* 作業簡介：爬取張愛玲四篇中篇小說內容，並使用jiebaR、NLP和tm套件包協助斷詞，最後算出四篇小說裡面的詞的TF-IDF值。
* 作業連結：[HW_5](https://github.com/Suuuuny/courseR/tree/master/week_5)<br />
  >問題：
  >1.起初以為文學作品做文字探勘應該十分偷甲步，因為部分日常覺得冗贅的詞，可能是作家偏好或帶有某些意象，因此不能隨意刪去，這也意味著在文字清理的部分就可以少做工。但後來發現文學作品做文字探勘的麻煩之處在於，如何處理保留詞！除了大量的人名以外，一些地域時空慣用詞、狀聲詞等，有時間的話，都應該多次檢視讀本，整理下來。<br />
  >2.另外遇到的困難是，斷完的詞過多，我不知道如何擷取有效資訊。除了上面用斷詞長度觀察以外，我原先有想到可以觀察用同一個開頭的斷詞們，例如以「一」開頭的，一次、一生、一串等，之後要做類似的分析可以試試看。
  >3.視覺化的部分，似乎只想到文字雲，不知道還有沒有其他比較適合的呈現方式。<br />
  >4.knit成Html檔時，挑出各篇小說裡面長度為1和3的高tf-idf值的部分，出現過多亂碼！<br />


Week_8
------
* In class : present titanic kaggle report

* After class :<br />
 1.crawl the news from udn.tw for the final project <br />
 2.do the project3<br />

* [Project3_ Rmd](https://github.com/dppss90008/NTU-CSX-DataScience--Group5/blob/master/Project3/project_3.Rmd)<br />
  [Project3_ html](https://dppss90008.github.io/NTU-CSX-DataScience--Group5/Project3/project_3.nb.html)<br />
  [Project3_ csv](https://github.com/dppss90008/NTU-CSX-DataScience--Group5/blob/master/Project3/answer.csv)<br />

Week_10
------
* In class : Learn Apriori

* After class :<br />
 1.find dataset for the project 4 <br />
 2.do the project4<br />

* [Project4_ html](https://suuuuny.github.io/courseR/Project_4/Project_4.nb.html)<br />


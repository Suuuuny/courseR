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
  >問題：<br />
  >1.起初以為文學作品做文字探勘應該十分偷甲步，因為部分日常覺得冗贅的詞，可能是作家偏好或帶有某些意象，因此不能隨意刪去，這也意味著在文字清理的部分就可以少做工。但後來發現文學作品做文字探勘的麻煩之處在於，如何處理保留詞！除了大量的人名以外，一些地域時空慣用詞、狀聲詞等，有時間的話，都應該多次檢視讀本，整理下來。<br />
  >2.另外遇到的困難是，斷完的詞過多，我不知道如何擷取有效資訊。除了上面用斷詞長度觀察以外，我原先有想到可以觀察用同一個開頭的斷詞們，例如以「一」開頭的，一次、一生、一串等，之後要做類似的分析可以試試看。<br />
  >3.視覺化的部分，似乎只想到文字雲，不知道還有沒有其他比較適合的呈現方式。<br />
  >4.knit成Html檔時，挑出各篇小說裡面長度為1和3的高tf-idf值的部分，出現過多亂碼！<br />


Week_7
------
* 作業主題：講解kaggle鐵達尼克程式碼
* 完成型態：小組
* 作業連結：[Project_2](https://github.com/dppss90008/NTU-CSX-DataScience--Group5/tree/master/Project2)<br />

Week_8
------
* 作業主題：EDA與預測鐵達尼號倖存者
* 完成型態：小組
* 作業簡介：使用鐵達尼號的乘客資料，找出關鍵因數，並建立模型預測誰可以生還。
* 作業連結：[Project_3](https://dppss90008.github.io/NTU-CSX-DataScience--Group5/Project3/TitanicVariable_final.html)<br />
* [資料](https://github.com/dppss90008/NTU-CSX-DataScience--Group5/tree/master/Project3)<br />
  >心得：<br />
  >1.boat變數對於模型的準確率提升非常大！<br />
  >2.body欄位不知意義為何，我們猜有填寫的應該是罹難者，因此也有納入模型。<br />


Week_9
------
* 作業主題：機器學習Arules
* 完成型態：小組
* 作業簡介：使用R資料集 iris 資料，練習建模。
* 作業連結：[Project_4](hhttps://weber12321.github.io/Weber1234/project4/project4.html)<br />
* [資料](https://github.com/dppss90008/NTU-CSX-DataScience--Group5/tree/master/project4)<br />
  >心得：<br />
  >1.iris資料集的資料類型都是數值化的，但apriori不能使用數值資料判斷，因此撰寫函數，將所有資料由小而大分成三個區間，並且類別化（as.factor），從而得到結果。


Week_10
------
* 作業主題：機器學習nnet
* 完成型態：小組
* 作業簡介：使用wine資料，練習建模。
* 作業連結：[Project_5](https://weber12321.github.io/Weber1234/Project5/project.html)<br />
* [資料](https://github.com/dppss90008/NTU-CSX-DataScience--Group5/tree/master/Project5)<br />


Final_Project
------
* 作業主題：選戰懶人包
* 完成型態：小組
* 作業簡介：依據2018年1-5月四大報新聞媒體文章、Facebook社群做文本分析與情緒分析，來探究台北市三大候選人(柯文哲、丁守中、姚文智)的關注議題、受眾(社群）有感議題、以及媒體對於這三位候選人的關注議題，與報導是否有偏頗傾向。<br />
* 作業連結：<br />
  [Final_Project_Rshiny](https://dppss90008.shinyapps.io/news_shiny/)<br />
  [Final_Project_PPT](https://docs.google.com/presentation/d/1p2vua3FNWMaGRWYAarCJ8WTwRFNiI9LmvhUbOLukDQY/edit#slide=id.p)<br />
* [資料](https://github.com/Suuuuny/NTU-CSX-DataScience-group5)<br />
* 結語：<br />
  分析完所有數值資料，用一句話形容候選人 :<br />
  1.柯文哲 : 媒體寵兒，有做事然後會希望讓大家看到的人，務實的事務官形象。<br />
  2.丁守中：存在感比較低，沒太多亮點，新聞幾乎都跟選舉連在一起，臉書發文的字中規中矩。<br />
  3.姚文智：力求突破，高飛理念型，希望爭取注意和支持。<br />
  >心得：<br />
  >1.爬蟲需要及早做！因為每一個網站的爬蟲方式可能不同，而且有些候選人的資料，如柯文哲，非常多，需要爬很久；後續的資料清理也很耗費時間，因此爬蟲能儘早完成就儘早完成！<br />
  >2.在做新聞文本的情緒分析時，可以發現似乎各候選人的文本反映出來的情緒不會相差太大或太極端。我們分析可能有兩個原因：第一個是常常一篇新聞裡面可能混雜了兩三位候選人的報導，因此做情緒分析的時候，自然相差就不大；第二個則是有些從官網爬下來的新聞不一定每一篇都是新聞ＱＱ有一些是論壇或是該報的旗下節目的訪談之類的，因為時間的關係，我們難以清理完這些，因此情緒分析的部分之後還尚待優化。<br />
  >3.在做LDA時，有些文本會出現亂碼，嘗試很多方法還是沒有辦法消掉，也是日後要優化的。<br />




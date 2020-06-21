import { Component } from '@angular/core';
import { NavController } from 'ionic-angular';
import { NewsProvider } from '../../providers/news/news';

@Component({
  selector: 'page-home',
  templateUrl: 'home.html'
})
export class HomePage {
  articles:any;

  constructor(public navCtrl: NavController,private newsProvider: NewsProvider) {
    this.loadNews()
  }

  loadNews(){
    this.newsProvider.getNews("top-headlines?country=id").subscribe(news => {
      this.articles = news['articles'];
      console.log(this.articles);
    })
  }

}

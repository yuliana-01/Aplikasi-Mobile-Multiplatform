import { Component } from '@angular/core'; 
import { NavController, NavParams, ViewController, 
MenuController } from 'ionic-angular'; 
import { UserAccount } from '../../models/user/user-model';  

@Component({ 
  selector: 'page-home',   templateUrl: 'home.html' 
}) 
export class HomePage { 
 
  userAccount: UserAccount = <UserAccount>{}; 
   constructor(public navCtrl: NavController, public navParams: 
NavParams, private viewCtrl: ViewController, 
menu: MenuController) {     menu.enable(true); 
    this.userAccount = this.navParams.get("menuAccount");     
    if(this.userAccount){ 
      console.log(this.userAccount); 
    }else{ 
      console.log("userAccount Params not Available in HomePage!"); 
    } 
  }  
  ionViewWillEnter() { 
    this.viewCtrl.showBackButton(false);  
  } 
} 


import { BrowserModule } from '@angular/platform-browser';
import { ErrorHandler, NgModule } from '@angular/core';
import { IonicApp, IonicErrorHandler, IonicModule } from 'ionic-angular';
import { SplashScreen } from '@ionic-native/splash-screen';
import { StatusBar } from '@ionic-native/status-bar';

import { MyApp } from './app.component';
import { HomePage } from '../pages/home/home';
import { UserProvider } from '../providers/user/user';
import { LoginPage } from '../pages/login/login'; 
import { RegisterPage } from '../pages/register/register'; 
 
import { IonicStorageModule }from '@ionic/storage'; 
import { AboutPage } from '../pages/about/about'; 
import { MenuPage } from '../pages/menu/menu';
import { DatabaseProvider } from '../providers/database/database';
import { ProductProvider } from '../providers/product/product';


@NgModule({
  declarations: [
    MyApp,
    HomePage,
    LoginPage,
    RegisterPage,     
    AboutPage,     
    MenuPage
  ],
  imports: [
    BrowserModule,
    IonicModule.forRoot(MyApp),
    IonicStorageModule.forRoot()
  ],
  bootstrap: [IonicApp],
  entryComponents: [
    MyApp,
    HomePage,
    LoginPage,
    RegisterPage,     
    AboutPage,     
    MenuPage
  ],
  providers: [
    StatusBar,
    SplashScreen,
    {provide: ErrorHandler, useClass: IonicErrorHandler},
    UserProvider,
    DatabaseProvider,
    ProductProvider
  ]
})
export class AppModule {}

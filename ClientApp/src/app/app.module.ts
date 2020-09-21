import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';

import {CommonModule } from '@angular/common';
import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { HttpClientModule } from '@angular/common/http';
import { TestPanelComponent } from './reusablecomponents/test-panel/test-panel.component';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { BackEndTestComponent } from './tests/back-end-test/back-end-test.component';
import { CustomButtonComponent } from './reusablecomponents/custom-button/custom-button.component';
import { HomeComponent } from './pages/home/home.component';
import { SignInComponent } from './pages/sign-in/sign-in.component';
import { FormsModule } from '@angular/forms';

@NgModule({
  declarations: [
    AppComponent,
    TestPanelComponent,
    BackEndTestComponent,
    CustomButtonComponent,
    HomeComponent,
    SignInComponent,
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    HttpClientModule,
    BrowserAnimationsModule,
    CommonModule,
    FormsModule,
    HttpClientModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule {

  
 }

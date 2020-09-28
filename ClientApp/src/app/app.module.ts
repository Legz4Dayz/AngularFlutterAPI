import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';

import {CommonModule } from '@angular/common';
import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { TestPanelComponent } from './reusablecomponents/test-panel/test-panel.component';
import { BackEndTestComponent } from './tests/back-end-test/back-end-test.component';
import { CustomButtonComponent } from './reusablecomponents/custom-button/custom-button.component';
import { HomeComponent } from './pages/home/home.component';
import { SignInComponent } from './pages/sign-in/sign-in.component';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import {HttpClientModule} from '@angular/common/http'
import {BrowserAnimationsModule} from '@angular/platform-browser/animations';
import { CreateAccountComponent } from './pages/create-account/create-account/create-account.component';
import { ValidationMessageComponent } from './reusablecomponents/validation-message/validation-message.component'

@NgModule({
  declarations: [
    AppComponent,
    TestPanelComponent,
    BackEndTestComponent,
    CustomButtonComponent,
    HomeComponent,
    SignInComponent,
    CreateAccountComponent,
    ValidationMessageComponent,
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    HttpClientModule,
    BrowserAnimationsModule,
    ReactiveFormsModule,
    CommonModule,
    FormsModule,
    HttpClientModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule {

  
 }

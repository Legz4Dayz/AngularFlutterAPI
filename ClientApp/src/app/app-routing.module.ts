import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { CreateAccountComponent } from './pages/create-account/create-account/create-account.component';
import { HomeComponent } from './pages/home/home.component';
import { SignInComponent } from './pages/sign-in/sign-in.component';
import { TestPanelComponent } from './reusablecomponents/test-panel/test-panel.component';

const routes: Routes = [
  {path: 'sign-in', component: SignInComponent},
  {path: 'create-account', component: CreateAccountComponent},
  {path: 'home', component: HomeComponent},
  {path: 'testing', component: TestPanelComponent},
  {path: '', redirectTo: 'sign-in', pathMatch: 'full'},
  {path: '**', component: SignInComponent},
]; 

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }

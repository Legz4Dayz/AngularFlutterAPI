import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { HomeComponent } from './pages/home/home.component';
import { TestPanelComponent } from './reusablecomponents/test-panel/test-panel.component';

const routes: Routes = [
  {path: 'home', component: HomeComponent},
  {path: 'testing', component: TestPanelComponent},
  {path: '', redirectTo: 'home', pathMatch: 'full'},
  {path: '**', component: HomeComponent},
];



@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }

import * as React from 'react';
import { RouteComponentProps, Link } from 'react-router-dom';
import Main from '../components/Main';
import MainNavigation from '../components/MainNavigation'; 
import MyHunts from '../components/MyHunts'; 

const MyHuntsPage: React.FC<RouteComponentProps> = () => (
  <Main>
    <MainNavigation />
    <MyHunts />
    </Main>
);

export default MyHuntsPage;
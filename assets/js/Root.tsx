import * as React from 'react';
import { BrowserRouter, Route, Switch } from 'react-router-dom';

/** import Header from './components/Header'; */
import HomePage from './pages/index';
import MyHuntsPage from './pages/myhunts';

const Root: React.FC = () => (
  <>
    { /* <Header /> */}
    <BrowserRouter>
      <Switch>
        <Route exact path="/" component={HomePage} />
        <Route path="/myhunts" component={MyHuntsPage} />
        {/* <Route path="/fetch-data" component={FetchDataPage} /> */}
      </Switch>
    </BrowserRouter>
  </>
);

export default Root;
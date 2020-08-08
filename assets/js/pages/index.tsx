import * as React from 'react';
import { RouteComponentProps, Link } from 'react-router-dom';
import Main from '../components/Main';
import UpcomingHunts from '../components/UpcomingHunts'; 
import UpcomingDeadlines from '../components/UpcomingDeadlines'; 
import MainNavigation from '../components/MainNavigation'; 
import {Jumbotron} from 'react-bootstrap';

const HomePage: React.FC<RouteComponentProps> = () => (
  <Main>
    <MainNavigation />
    <Jumbotron>
      <h1>Welcome to Draw Hunts Tracker!</h1>
      <p>
        A productive web framework that
        <br />
        does not compromise speed and maintainability.
      </p>
    </Jumbotron>    

    <section className="row">
        <UpcomingHunts />
        <UpcomingDeadlines />
    </section>

    <section className="row">
      <article className="column">
        <h2>Resources</h2>
        <ul>
          <li>
            <a href="https://hexdocs.pm/phoenix/overview.html">
              Guides &amp; Docs
            </a>
          </li>
          <li>
            <a href="https://github.com/phoenixframework/phoenix">Source</a>
          </li>
          <li>
            <a href="https://github.com/phoenixframework/phoenix/blob/v1.4/CHANGELOG.md">
              v1.4 Changelog
            </a>
          </li>
        </ul>
      </article>
      <article className="column">
        <h2>Help</h2>
        <ul>
          <li>
            <a href="https://elixirforum.com/c/phoenix-forum">Forum</a>
          </li>
          <li>
            <a href="https://webchat.freenode.net/?channels=elixir-lang">
              #elixir-lang on Freenode IRC
            </a>
          </li>
          <li>
            <a href="https://twitter.com/elixirphoenix">
              Twitter @elixirphoenix
            </a>
          </li>
        </ul>
      </article>
    </section>
  </Main>
);

export default HomePage;
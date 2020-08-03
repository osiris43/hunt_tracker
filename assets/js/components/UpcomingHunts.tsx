import * as React from "react";
import useHuntService from "../services/huntService";
import Loader from './Loader';
import {Card, ListGroup} from 'react-bootstrap';

const UpcomingHunts: React.FC = () => {
    const service = useHuntService();

    return (
        <>
            <Card>
                <Card.Body>
                    <Card.Title>Upcoming Hunts</Card.Title>
                    <ListGroup>
        <div>
            {service.status === 'loading' && <div><Loader /></div>}
            
            {service.status === 'loaded' &&
                service.payload.data.map(hunt => (
                <ListGroup.Item>{hunt.start_date} | {hunt.category} | {hunt.location}</ListGroup.Item>
        ))}
        </div>
        {service.status === 'error' && (
            <div>Error, the backend moved to the dark side.</div>
          )}
                    </ListGroup>
                </Card.Body>
            </Card>
          </>
    );
};

export default UpcomingHunts;
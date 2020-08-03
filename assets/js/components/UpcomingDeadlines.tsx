import * as React from "react";
import useCategoryService from "../services/categoryService";
import Loader from './Loader';
import {Card, ListGroup} from 'react-bootstrap';

const UpcomingDeadlines: React.FC = () => {
    const service = useCategoryService();

    return (
        <>
            <Card>
                <Card.Body>
                    <Card.Title>Upcoming Deadlines</Card.Title>
                    <ListGroup>
        <div>
            {service.status === 'loading' && <div><Loader /></div>}
            {service.status === 'loaded' &&
                service.payload.data.map(category => (
                <ListGroup.Item>{category.deadline} | {category.category}</ListGroup.Item>
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

export default UpcomingDeadlines;
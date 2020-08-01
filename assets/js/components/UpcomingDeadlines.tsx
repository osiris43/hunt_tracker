import * as React from "react";
import useCategoryService from "../services/categoryService";
import Loader from './Loader';

const UpcomingDeadlines: React.FC = () => {
    const service = useCategoryService();

    return (
        <>
        <div>
            {service.status === 'loading' && <div><Loader /></div>}
            {service.status === 'loaded' &&
                service.payload.data.map(category => (
                <div key={category.id}>{category.deadline} {category.category} </div>
        ))}
        </div>
        {service.status === 'error' && (
            <div>Error, the backend moved to the dark side.</div>
          )}
          </>
    );
};

export default UpcomingDeadlines;
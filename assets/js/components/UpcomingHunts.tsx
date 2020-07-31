import * as React from "react";
import useHuntService from "../services/huntService";
import Loader from './Loader';

const UpcomingHunts: React.FC<{}> = () => {
    const service = useHuntService();

    return (
        <>
        <div>
            {service.status === 'loading' && <div><Loader /></div>}
            {service.status === 'loaded' &&
                service.payload.data.map(hunt => (
                <div key={hunt.id}>{hunt.start_date} {hunt.location}</div>
        ))}
        </div>
        {service.status === 'error' && (
            <div>Error, the backend moved to the dark side.</div>
          )}
          </>
    );
};

export default UpcomingHunts;
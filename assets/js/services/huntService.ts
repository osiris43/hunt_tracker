import {useEffect, useState} from 'react';
import {Service} from '../types/service';
import {Hunt} from '../types/hunt';

export interface Hunts{
    data: Hunt[];
  }

const useHuntService = () => {
    const [result, setResult] = useState<Service<Hunts>>({status: 'loading'});

    useEffect(() => {
        fetch('http://localhost:4000/api/hunts')
        .then(response => response.json())
        .then(response => setResult({ status: 'loaded', payload: response}))
        .catch(error => setResult({ status: 'error', error }));
    }, []);

    return result;
}

export default useHuntService;
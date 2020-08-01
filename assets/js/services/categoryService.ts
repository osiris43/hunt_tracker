import {useEffect, useState} from 'react';
import {Service} from '../types/service';
import {Category} from '../types/category';

export interface Categories{
    data: Category[];
  }

const useCategoryService = () => {
    const [result, setResult] = useState<Service<Categories>>({status: 'loading'});

    useEffect(() => {
        fetch('/api/categories')
        .then(response => response.json())
        .then(response => setResult({ status: 'loaded', payload: response}))
        .catch(error => setResult({ status: 'error', error }));
    }, []);

    return result;
}

export default useCategoryService;
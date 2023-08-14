import {createAsyncThunk} from "@reduxjs/toolkit";

class DataService {
    constructor() {
        this.fetch = this.fetch.bind(this);

    }

    fetch() {
        return createAsyncThunk(
            'data/fetchData',
            async () => {
                const response = await fetch('/api/v1/hello');
                console.log(response)
                return await response.json();
            }
        )
    }
}

export default DataService;

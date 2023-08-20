import {createAsyncThunk} from "@reduxjs/toolkit";
import axios from "axios";

const DataService = (url)=> {

    const getHello = createAsyncThunk(
            'data/fetchData',
            async (arg, thunkAPI) => {
                try {
                    const data = await axios.get(`${url}/hello`).then(res => res.data)
                    console.log(data)
                    return data;
                } catch (error) {
                    const message = error.response && error.response.data && error.response.data.message
                        || error.message || error.toString();
                    console.log(message)
                    return thunkAPI.rejectWithValue(message);
                }
            }
        )

    return {
        getHello
    }

}

export default DataService("api/v1");

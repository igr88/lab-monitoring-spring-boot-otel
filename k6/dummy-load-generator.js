import http from 'k6/http';
import { sleep } from 'k6';

export const options = {
    stages: [
        { duration: '5s', target: 10 }, // Ramp-up to 10 users over 10 seconds
        { duration: '60s', target: 10 }, // Maintain 10 users for N seconds
    ],
};

export default function () {
    const url = 'http://127.0.0.1:8080/';
    const response = http.get(url);

    // Optional: Check response status
    if (response.status !== 200) {
        console.error(`Request failed with status ${response.status}`);
    }

    sleep(1); // Adjust sleep to control request frequency per user
}

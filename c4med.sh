#include <stdio.h>

//fxn to calculate the moving avg of the data
void muchiko(int data[], int n, int windowSize, float result[]) {
    for (int i = 0; i <= n - windowSize; i++) {
        float sum = 0; 
        for (int j = 0; j < windowSize; j++) {
            sum += data[i + j];  //add the current element to the sum
        }
        //cal the avg and store it in the result array
        result[i] = sum / windowSize;
    }
}

// fxn to calculate the moving median of the data
void sanchiko(int data[], int n, int windowSize, float result[]) {
	for (int i = 0; i <= n - windowSize; i++) {
        int window[windowSize]; 
        for (int j = 0; j < windowSize; j++) {
            window[j] = data[i + j];  //store the current element in the window
        }
        //sorting the window array using bubble sort
        for (int j = 0; j < windowSize - 1; j++) {
            for (int k = 0; k < windowSize - j - 1; k++) {
                //swapping elements if they are in the wrong order
                if (window[k] > window[k + 1]) {
                    int temp = window[k];  
                    window[k] = window[k + 1];  
                    window[k + 1] = temp; 
                }
            }
        }
        //store the median in the result array
        result[i] = window[windowSize / 2]; 
    }
}

int main() {
    int n, windowSize;  
    printf("Enter the number of data points: ");
    scanf("%d", &n);  
    int data[n];
    printf("Enter the data points: ");
    for (int i = 0; i < n; i++) {
        scanf("%d", &data[i]); 
    }
    printf("Enter the window size: ");
    scanf("%d", &windowSize);
    //checking if windowsize is approapriate
    if (windowSize > n || windowSize <= 0) {
        printf("Invalid window size. It must be between 1 and %d.\n", n);
        return 1;
    }

    float muchikodata[n - windowSize + 1];
    float sanchikodata[n - windowSize + 1];

    //fxn to find the moving average and median
    muchiko(data, n, windowSize, muchikodata);
    sanchiko(data, n, windowSize, sanchikodata);

    //print the original data
    printf("Original Data: ");
    for (int i = 0; i < n; i++) printf("%d ", data[i]);
    printf("\nMuchiko: ");  //print the moving average results
    for (int i = 0; i <= n - windowSize; i++) printf("%.1f ", muchikodata[i]);
    printf("\nSanchiko: ");  //print the moving median results
    for (int i = 0; i <= n - windowSize; i++) printf("%.1f ", sanchikodata[i]);
    
    return 0;
}
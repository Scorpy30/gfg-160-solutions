class Solution {
    public void reverseArray(int arr[]) {
        // code here
        if(arr.length % 2 != 0){
            int end = arr.length - 1;
            for(int i = 0; i<=arr.length/2; i++){
                int temp = arr[i];
                arr[i] = arr[end];
                arr[end] = temp;
                end--;
            }
        } else {
            int end = arr.length - 1;
            for(int i = 0; i < arr.length/2; i++){
                int temp = arr[i];
                arr[i] = arr[end];
                arr[end] = temp;
                end--;
            }
        }
    }
}


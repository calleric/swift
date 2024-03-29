## AsyncLetApp to run background tasks in parallel in Swift


Swift Asynchronous Programming is a method of writing code that allows certain tasks
to run concurrently, rather than sequentially. The async/await syntax was introduced
in Swift 5.5 at WWDC 2021. This app demonstrates use of "async let" is used to run
multiple background tasks in parallel and wait for their combined results.



### Synchronous tasks block the UI
<img width="400" 
alt="synchronous download of file"
src="https://github.com/calleric/swift/blob/main/AsyncLetApp/images/synchronous-download-simulation.png">

<BR>

### Asynchronous tasks using async let downloads multiple files in paralle
<img width="400" 
alt="Asynchronous tasks using async let downloads multiple files in parallel.png"
src="https://github.com/calleric/swift/blob/main/AsyncLetApp/images/Asynchronous-download-in-parallel.png">

<BR>

### Simulate downloading multiple files in parallel
<img width="300" 
alt="Simulate downloading multiple files in parallel"
src="https://github.com/calleric/swift/blob/main/AsyncLetApp/images/Asynchronous-download-in-multiple-files-in-parallel.gif">



<BR>
<BR>
<BR>


Full article is <a href="https://swdevnotes.com/swift/2023/use-async-let-to-run-background-tasks-in-parallel-in-swift/" target="_blank">
Use async let to run background tasks in parallel in Swift
</a>


<BR>
<BR>

<HR>

<BR>
<BR>

### Cancelling a parent taks will cascade to cancel all child tasks
<img width="800" 
alt="Cancelling a parent taks will cascade to cancel all child tasks"
src="https://github.com/calleric/swift/blob/main/AsyncLetApp/images/cancel-task-cascade.png">

<BR>

### Simulate downloading  and cancelling multiple files in parallel
<img width="300" 
alt="Simulate downloading  and cancelling multiple files in parallel"
src="https://github.com/calleric/swift/blob/main/AsyncLetApp/images/cancel-resume-multiple-tasks.gif">



<BR>
<BR>
<BR>


Full article is <a href="https://swdevnotes.com/swift/2023/how-to-cancel-a-background-task-in-swift/" target="_blank">
How to cancel a background task in Swift
</a>


<BR>
<BR>
<BR>

function notify()
{
    console.log("hello")
document.getElementById("notification").addEventListener('click',function()
{
    document.getElementById("notification").style="display:none";
});
}

function redirect_to(path)
{
    window.location=path;
}
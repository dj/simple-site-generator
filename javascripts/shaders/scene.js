// ========================================================================= //
// Setup Scene                                                               //
// ========================================================================= //
var scene = new THREE.Scene(),
    camera = new THREE.PerspectiveCamera( 75, window.innerWidth/window.innerHeight, 0.1, 1000 ),
    renderer = new THREE.WebGLRenderer(),
    sceneWidth = window.innerWidth,
    sceneHeight = window.innerHeight,
    controls = new THREE.OrbitControls(camera)
    controls.damping = 0.2;
    controls.addEventListener('change', render);

camera.setViewOffset(
    sceneWidth,
    window.innerHeight,
    0, 0,
    sceneWidth,
    sceneHeight
)

renderer.setSize(sceneWidth, sceneHeight);
document.body.appendChild(renderer.domElement);

// ========================================================================= //
// Setup Geometry                                                            //
// ========================================================================= //
var cube = new THREE.BoxGeometry( 1, 1, 1 );
var material = new THREE.MeshBasicMaterial( { color: 0x00ff00 } );

// Get the shader strings from the DOM
var shaderMaterial = new THREE.ShaderMaterial({
    vertexShader:   document.getElementById('vshader').text,
    fragmentShader: document.getElementById('fshader').text
});

cube = new THREE.Mesh(cube, shaderMaterial);
cube.rotation.x = (Math.PI / 4);
cube.rotation.y = (Math.PI / 4);

scene.add( cube );
var light = new THREE.AmbientLight( 0x404040 ); // soft white light
scene.add( light );

camera.position.z = 5;
// ========================================================================= //
// Run the Scene!                                                            //
// ========================================================================= //

var render = function () {
    requestAnimationFrame( render );

    // cube.rotation.x += 0.01;
    // cube.rotation.y += 0.01;
    // cube.rotation.z += 0.01;

    renderer.render(scene, camera);
};

render();

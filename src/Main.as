package{
	import com.adobe.glsl2agal.newThread;
	import laya.d3.core.Camera;
    import laya.d3.core.MeshSprite3D;
    import laya.d3.core.Sprite3D;
    import laya.d3.core.material.StandardMaterial;
    import laya.d3.core.light.DirectionLight;
    import laya.d3.core.scene.Scene;
    import laya.d3.math.Vector3;
    import laya.d3.math.Vector4;
    import laya.d3.resource.models.BoxMesh;
    import laya.display.Stage;
    import laya.utils.Stat;
    import laya.d3.resource.Texture2D;

	public class Main{
		public function Main() {
			//初始化引擎
            Laya3D.init(0, 0,true);
            //适配模式
            Laya.stage.scaleMode = Stage.SCALE_FULL;
            Laya.stage.screenMode = Stage.SCREEN_NONE;
            //开启统计信息
            Stat.show();
            //添加3D场景---------------------------------
            var scene:Scene = Laya.stage.addChild(new Scene()) as Scene;
            //添加摄像机---------------------------------
            var camera:Camera = (scene.addChild(new Camera( 0, 0.1, 100))) as Camera;
            //移动摄像机位置
            camera.transform.translate(new Vector3(0, 3, 3));
              //旋转摄像机方向（角度）
            camera.transform.rotate(new Vector3( -30, 0, 0), true, false);
              //设置背景颜色
            camera.clearColor = null;
            //添加平行光----------------------------------
            var directionLight:DirectionLight = scene.addChild(new DirectionLight()) as DirectionLight;
              //灯光的漫反射颜色
            directionLight.color = new Vector3(1.6, 1.6, 1.6);
              //灯光的方向(弧度)
            directionLight.direction = new Vector3(1, -1, 0);
            //添加自定义模型------------------------------
            var box:MeshSprite3D = scene.addChild(new MeshSprite3D(new BoxMesh(1,1,1))) as MeshSprite3D;
              //模型旋转方向
            box.transform.rotate(new Vector3(0,45,0),false,false);
              //创建模型的材质
            var material:StandardMaterial = new StandardMaterial();
              //材质的漫反射贴图
            material.diffuseTexture = Texture2D.load("res/icon.png");
              //为模型赋上材质
            box.meshRender.material = material;
            //这里我们添加转动的逻辑---------------------------------------
              //旋转方向与角度设置
            var vect:Vector3 = new Vector3(1,1,0);
              //每10毫秒旋转一次
            Laya.timer.loop(10,null,function():void{
                box.transform.rotate(vect,true,false);
            });
		}
		
	}
	
}
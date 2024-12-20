using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class RotatePrefabObjects : MonoBehaviour
{
    public Transform[] objectsToRotate; // 需要旋轉的目標物件
    public Vector3 rotationSpeed = new Vector3(0, 1, 0); // 旋轉速度

    void Update()
    {
        foreach (Transform obj in objectsToRotate)
        {
            obj.Rotate(rotationSpeed * Time.deltaTime);
        }
    }
}

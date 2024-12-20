using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class MeteorSpawner : MonoBehaviour
{
    public GameObject meteorPrefab; // 流星的模板
    public float spawnInterval = 1f; // 每隔多久生成一次流星
    public Vector3 spawnAreaMin = new Vector3(-1, -3, -5); // 生成範圍的最小值
    public Vector3 spawnAreaMax = new Vector3(1, 3, -10); // 生成範圍的最大值

    void Start()
    {
        // 定時生成流星
        InvokeRepeating("SpawnMeteor", 0, spawnInterval);
    }

    void SpawnMeteor()
{
    int meteorCount = 5; // 每次生成 5 個流星
    for (int i = 0; i < meteorCount; i++)
    {
        float randomX = Random.Range(spawnAreaMin.x, spawnAreaMax.x);
        float randomY = Random.Range(spawnAreaMin.y, spawnAreaMax.y);
        float randomZ = Random.Range(spawnAreaMin.z, spawnAreaMax.z);
        Vector3 spawnPosition = new Vector3(randomX, randomY, randomZ);

        Instantiate(meteorPrefab, spawnPosition, Quaternion.identity);
    }
}

}
